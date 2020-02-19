//
//  RepositoriesManager.swift
//  github-challenge
//
//  Created by Gerson Vieira on 18/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Foundation
protocol RepositoriesManagerDelegate {
    func didFetch(_ data: [RepositoriesViewModel])
    func errorToFetch(_ error: String)
}

class RepositoriesManager: NSObject {
    
    lazy var business: RepositoriesBusiness = RepositoriesBusiness(delegate: self)
    var delegate: RepositoriesManagerDelegate?
    
    init(delegate: RepositoriesManagerDelegate? = nil){
        super.init()
        self.delegate = delegate
    }
    
    func getRepositories(){
        self.business.requestRepositories()
    }
}

extension RepositoriesManager: RepositoriesBusinessDelegate {
    func didFetch(_ data: RepositoriesModel) {
        let repositories = wrapToViewModel(model: data)
        self.delegate?.didFetch(repositories)
    }
    
    func errorToFetch(_ error: String) {
        self.delegate?.errorToFetch(error)
    }
    
    func wrapToViewModel(model: RepositoriesModel) -> [RepositoriesViewModel] {
        var repositories = [RepositoriesViewModel]()
        guard let items = model.items else {
            self.delegate?.errorToFetch("Items is empty")
            return repositories
        }
        
        for item in items {
            let viewModel = RepositoriesViewModel(entry: item)
            repositories.append(viewModel)
        }
        
        return repositories
    }
    
}
