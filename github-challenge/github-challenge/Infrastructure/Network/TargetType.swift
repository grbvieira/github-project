//
//  TargetType.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Moya

enum Paths: String {
    case repositories = "/search/repositories"
}

enum Keys: String {
    case query = "q"
    case sort
    case page
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
