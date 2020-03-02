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
    private var fetching = false
    private var viewModel = [RepositoriesViewModel]()
    private var repositoriesResponse: Request<[RepositoriesModel]> = .none {
        didSet { reloadStack() }
    }
    
    var page = 1
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repositories"
        self.customView.scrollView.delegate = self
        self.fetchRepositories()
    }
    
    func fetchRepositories() {
        disposeBag = DisposeBag()
        repositoriesResponse = .loading
        fetching = true
        fetch.resquestRepositories(page: page)
            .subscribe { [weak self] event in
                guard let self = self else { return }
                switch event {
                case .success(let response):
                    self.repositoriesResponse = .success([response])
                    self.fetching = false
                case .error(let error):
                    self.repositoriesResponse = .failure(error.localizedDescription)
                    self.fetching = false
                }
        }.disposed(by: disposeBag)
    }
    
    func reloadStack() {
        switch  repositoriesResponse {
        case .loading :
            self.customView.loadingView()
        case .success(let response):
            let viewModel = FillViewModel().wrapToViewModel(model: response[0])
            self.viewModel = viewModel
            customView.fillRepositories(with: self.viewModel)
        case .failure(let error):
            self.customView.removeLoadView()
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
extension RepositoriesListViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height) {
            if !fetching {
                print("CHEGOU AO FIM O SCROLL")
                page = page + 1
                fetchRepositories()
            }
        }
    }
}

