//
//  API.swift
//  moya-integration
//
//  Created by Creatives Solutions on 11/10/2024.
//

import Moya

enum API {
    case users
    case userDetail(userId: Int)
}

extension API: TargetType {
    
    // we can define our baseURL or multiple baseURLs for different enum type
    var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/") else { fatalError() }
        return url
    }
    
    // extra path added to baseURL
    var path: String {
        switch self {
        case .users:
            return "todos/"
        case .userDetail(let userId):
            return "todos/" + String(userId)
        }
    }
    
    // we can specify different method types
    var method: Method {
        return .get
    }
    
    
    // Defines the type of task for the request.
       // Here, we're simply making a plain request without any additional parameters.
       var task: Task {
           switch self {
           case .users, .userDetail:
               return .requestPlain
           }
       }
       
       // Set the headers for the request.
       // In this case, we're indicating that we expect JSON responses.
       var headers: [String: String]? {
           return ["Content-type": "application/json"]
       }

}
