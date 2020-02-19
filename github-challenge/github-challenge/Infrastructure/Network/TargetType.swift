//
//  TargetType.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Moya


//https://api.github.com/search/repositories
//language:swift
//sort=stars
enum Paths: String {
    case repositories = "/search/repositories"
}

enum Keys: String {
    case query = "q"
    case sort
}

enum Values: String {
    case sort = "stars"
    case language = "language:swift"
}

extension TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var headers: [String : String]? {
        return ["":""]
    }
}
/*
    var headers: [String : String]? {
        switch self {
        case .getData:
            return ["content-type": "application/json"]
        }
    }
    
}

*/
