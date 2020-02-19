//
//  RepositoryListViewController.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class RepositoriesListViewController: BaseViewController<RepositoryListView> {
     
    private lazy var manager = RepositoriesManager(delegate: self)
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.getRepositories()
    }
    
    func reloadView(with data: [RepositoriesViewModel]) {
        self.customView.cleanMainStak()
    }
}

extension RepositoriesListViewController: RepositoriesManagerDelegate {
    func didFetch(_ data: [RepositoriesViewModel]) {
        self.reloadView(with: data)
        self.customView.repositoriesList = data
    }
    
    func errorToFetch(_ error: String) {
        self.customView.cleanMainStak()
        let alert = UIAlertController(title: "Alert", message: "Error: \(error)",         preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
    }
    
    
}
