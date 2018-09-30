//
//  APIRouter.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-14.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case login(email:String, password:String)
    case signup(email:String, password:String)
    case getPosts
    case getPost(id: Int)
    case addPost(post: Post)
    case upload(images: [String])
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login, .signup:
            return .post
        case .getPosts, .getPost:
            return .get
        case .addPost:
            return .post
        case .upload:
            return .post
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return "/login"
        case .signup:
            return "/register"
        case .getPosts:
            return "/posts"
        case .getPost(let id):
            return "/posts/\(id)"
        case .addPost:
            return "/posts"
        case .upload:
            return "/uploads"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password), .signup(let email, let password):
            return [K.APIParameterKey.email: email, K.APIParameterKey.password: password]
        case .getPosts, .getPost:
            return nil
        case .addPost(let post):
            return [
                "description": post.description,
                "artist_name": post.artist_name,
                "artist_id": post.artist_id,
                "username": post.username,
                "user_id": post.user_id,
                "image": post.image
            ]
        case .upload(let images):
            return [K.APIParameterKey.images: images]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.DevelopmentServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let params = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                // throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
