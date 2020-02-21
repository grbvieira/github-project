//
//  RepositoryView.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class RepositoryListView: UIView {
    
    //    var repositoriesList: [RepositoriesViewModel] = []{
    //        didSet {
    //            fillRepositories()
    //        }
    //    }
    var mainStack = UIStackView()
    
    required init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        setupUI()
        setupStack()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .white
    }
    
    func setupStack() {
        mainStack.alignment = .fill
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        mainStack.spacing = 2.0
        mainStack.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.addSubview(mainStack)
    }
    
    func cleanMainStak() {
        self.mainStack.subviews.forEach({
            $0.removeFromSuperview()
        })
    }
    
    func fillRepositories(with data: [RepositoriesViewModel]) {
        
        for item in data.enumerated() {
            if item.offset <= 3 {
                mainStack.addArrangedSubview(RepositoryViewDetail(with: item.element))
                
            }
        }
    }
}
