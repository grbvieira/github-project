//
//  RespositoriesProvider.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Moya

enum Response {
    case sucess(T)
    case failure
}

protocol APIProtocol {
    func resquestRepositories()
}
class RepositoriesProvider {
    
}
