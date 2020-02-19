//
//  RepositoryListViewController.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class RepositoriesListViewController: BaseViewController<RepositoryListView> {
     
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reloadView(with data: [RepositoriesViewModel]) {
        self.clearStack()
        
        for repo in data {
            
        }
    }
    
    func clearStack() {
        customView.mainStack.subviews.forEach({
            $0.removeFromSuperview()
        })
    }
}

extension RepositoriesListViewController: RepositoriesManagerDelegate {
    func didFetch(_ data: [RepositoriesViewModel]) {
        self.reloadView(with: data)
    }
    
    func errorToFetch(_ error: String) {
        self.clearStack()
        let alert = UIAlertController(title: "Alert", message: "Error: \(error)",         preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
    }
    
    
}
