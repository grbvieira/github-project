//
//  RespositoriesProvider.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Moya
import RxSwift
enum Result<T> {
    case sucess(T)
    case failure(Error)
}

protocol APIProtocol {
    func resquestRepositories() -> Single<RepositoriesModel>
}
class RepositoriesProvider: APIProtocol {
    
    func resquestRepositories() -> Single<RepositoriesModel> {
        return provider.rx
            .request(.repositories)
            .map { RepositoriesModel.map(data: $0.data)! }
        
    }
    
}
