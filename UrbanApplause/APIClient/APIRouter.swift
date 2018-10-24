//
//  APIRouter.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-14.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import Alamofire
import Moya

let apiProvider = MoyaProvider<APIRouter>()

enum APIRouter {
    
    case login(email:String, password:String)
    case signup(email:String, password:String)
    
    case getPosts
    case getPost(id: Int)
    case addPost(post: Post)
    case upload(images: [String])
    case getImage(imageName: String)
    
    
}

extension APIRouter: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:8080/api")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .signup:
            return "/register"
        case .getPosts, .addPost:
            return "/posts"
        case .getPost(let id):
            return "/posts\(id)"
        case .upload:
            return "/uploads"
        case .getImage(let imageName):
            return "/uploads/\(imageName)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signup, .addPost, .upload:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task { // parameters
        switch self {
        case .login(let email, let password), .signup(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: URLEncoding.queryString)
        case .addPost(let post):
            return .requestParameters(parameters: [
                "description": post.description,
                "artist_name": post.artist_name,
                "artist_id": post.artist_id,
                "username": post.username,
                "user_id": post.user_id,
                "image": post.image
            ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

// MARK: - Response Handlers
extension Moya.Response {
    
    func mapNSArray() throws -> NSArray {
        print("handling response")
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}
