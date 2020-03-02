//
//  ApiTarge.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Moya

let provider = MoyaProvider<APITarget>( endpointClosure: { (target) -> Endpoint in

    return Endpoint(url: "\(target.baseURL)\(target.path)",
        sampleResponseClosure: {.networkResponse(200, target.sampleData)},
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers)

}, plugins: [NetworkLoggerPlugin(verbose: false)])

enum APITarget{
    case repositories(page: Int)
}

extension APITarget: TargetType {
    
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
        case .repositories(let page):
            var parameters: [String: Any] = [:]
            parameters[Keys.query.rawValue] = Values.language.rawValue
            parameters[Keys.sort.rawValue] =  Values.sort.hashValue
            parameters[Keys.page.rawValue] = page
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
}
