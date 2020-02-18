//
//  ApiTarge.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Moya

//let provider = MoyaProvider<APITarget>( endpointClosure: { (target) -> Endpoint in
//
//    return Endpoint(url: "\(target.baseURL)\(target.path)",
//        sampleResponseClosure: {.networkResponse(200, target.sampleData)},
//        method: target.method,
//        task: target.task,
//        httpHeaderFields: target.headers)
//
//}, plugins: [NetworkLoggerPlugin(verbose: false)])

enum APITarget {
    
    case repositories
//    case login(email: String, password: String)
//    case getEnterprises(query: String)
//    case getEnterpriseDetails(id: Int)
}

extension APITarget {
    
    var path: String {
        switch  self {
        case .repositories: return Paths.repositories.rawValue
        }
    }
    
    var method: Method {
        switch self {
        case .repositories: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .repositories:
            var parameters: [String: Any] = [:]
            parameters[Keys.sort.rawValue] =  Values.sort.hashValue
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
}
