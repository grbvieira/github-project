//
//  RespositoriesProvider.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Moya
import RxSwift

protocol APIProtocol {
    func resquestRepositories() -> Single<RepositoriesModel>
}
class RepositoriesProvider: APIProtocol {
    
    func resquestRepositories() -> Single<RepositoriesModel> {
        return provider.rx
            .request(.repositories)
            .map {
                let response = try JSONDecoder().decode(RepositoriesModel.self, from: $0.data)
                return response
        }
    }
}
extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}
