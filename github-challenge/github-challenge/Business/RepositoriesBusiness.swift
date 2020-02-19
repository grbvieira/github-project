//
//  RepositoriesBusiness.swift
//  github-challenge
//
//  Created by Gerson Vieira on 18/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import RxSwift
import RxCocoa

protocol RepositoriesBusinessDelegate {
    func didFetch(_ data: RepositoriesModel)
    func errorToFetch(_ error: String)
}

class RepositoriesBusiness {
    
    private let provider: RepositoriesProvider = RepositoriesProvider()
    var delegate: RepositoriesBusinessDelegate?
    private var disposeBag: DisposeBag!
    init(delegate: RepositoriesBusinessDelegate) {
        self.delegate = delegate
    }
    
    func requestRepositories() {
        disposeBag = DisposeBag()
        provider.resquestRepositories()
            .subscribe() { [weak self] (event) in
            guard let self = self else { return }
                
                switch event {
                case .success(let response):
                    self.delegate?.didFetch(response)
                case .error(let error):
                    self.delegate?.errorToFetch(error.localizedDescription)
                }
            
        }.disposed(by: disposeBag)
    }
}
