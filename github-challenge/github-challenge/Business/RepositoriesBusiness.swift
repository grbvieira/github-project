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
    
    
   func getMock(){
       if let path = Bundle.main.path(forResource: "repoMock", ofType: "json") {
           do {
                let fileUrl = URL(fileURLWithPath: path)
                           // Getting data from JSON file using the file URL
               let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
               let response = try  JSONDecoder().decode(RepositoriesModel.self, from: data)
            self.delegate?.didFetch(response )
           } catch {
              self.delegate?.errorToFetch("Não foi possivel ler o json")
              // fatalError("Não foi possivel ler o json")
           }
       }
   }
}
