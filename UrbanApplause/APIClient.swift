//
//  APIClient.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

public class APIClient {
    let baseEndpoint = "http://localhost:4000/api/"
    private let session = URLSession(configuration: .default)
    
    private let publicKey: String
    private let privateKey: String
    
    public init(publicKey: String, privateKey: String) {
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    // Sends a request to Marvel servers, calling the completion method when finished
    public func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<DataContainer<T.Response>>) {
        let endpoint = self.endpoint(for: request)
        var httpRequest = URLRequest(url: endpoint)
        
        // set headers
        var headers = httpRequest.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        httpRequest.allHTTPHeaderFields = headers
        // httpRequest.httpBody = request.
        let task = session.dataTask(with: httpRequest) { data, response, error in
            if let data = data {
                do {
                    // Decode the top level response, and look up the decoded response to see
                    // if it's a success or a failure
                    let apiResponse = try JSONDecoder().decode(APIResponse<T.Response>.self, from: data)
                    
                    if let dataContainer = apiResponse.data {
                        completion(.success(dataContainer))
                    } else if let message = apiResponse.message {
                        completion(.failure(APIError.server(message: message)))
                    } else {
                        completion(.failure(APIError.decoding))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    /// Encodes post body based on the given request
    private func body<T: APIRequest>(for request: T) -> Data {
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(request) else { fatalError("invalid body format") }
        return body
    }
    /// Encodes a URL based on the given request
    /// Everything needed for a public request to Marvel servers is encoded directly in this URL
    private func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let parameters = try? URLQueryEncoder.encode(request) else { fatalError("Wrong parameters") }
        
        // This timestamp and hash are needed for Marvel requests
        let timestamp = Date().timeIntervalSince1970
        let hash = "\(timestamp)\(privateKey)\(publicKey)".md5
        
        // Construct the final URL with all the previous data
        return URL(string: "\(baseEndpoint)\(request.path)?ts=\(timestamp)&hash=\(hash)&apikey=\(publicKey)&\(parameters)")!
    }
}
