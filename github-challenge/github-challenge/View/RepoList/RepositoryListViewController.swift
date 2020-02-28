//
//  RepositoryListViewController.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum Request<T> {
    case none
    case loading
    case success(T)
    case failure(String)
}

class RepositoriesListViewController: BaseViewController<RepositoryListView> {
    private var disposeBag: DisposeBag!
    private let fetch = RepositoriesProvider()
    private var repositoriesResponse: Request<[RepositoriesModel]> = .none {
        didSet { reloadStack() }
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositories"
        self.fetchRepositories()
    }
    
    func fetchRepositories() {
        disposeBag = DisposeBag()
        repositoriesResponse = .loading
        fetch.resquestRepositories()
            .subscribe { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .success(let response):
                self.repositoriesResponse = .success([response])
            case .error(let error):
                self.repositoriesResponse = .failure(error.localizedDescription)
            }
        }.disposed(by: disposeBag)
    }
    
    func reloadStack() {
        customView.cleanMainStak()
        switch  repositoriesResponse {
        case .loading :
            self.customView.loadingView()
            return
        case .success(let response):
            let viewModel = FillViewModel().wrapToViewModel(model: response[0])
             self.customView.loadingView()
            customView.fillRepositories(with: viewModel)
        case .failure(let error):
            self.alert(message: error)
        case .none:
            return
        }
    }
    
    func alert(message: String) {
        let alert = UIAlertController(title: "Alert", message: "Error: \(message)",
            preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
