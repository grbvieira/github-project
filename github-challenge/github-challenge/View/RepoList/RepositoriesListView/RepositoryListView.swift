//
//  RepositoryView.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class RepositoryListView: UIView {
    var mainStack = UIStackView()
    let scrollView = UIScrollView()
    
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
        self.createScroll()
        mainStack.alignment = .fill
        mainStack.axis = .vertical
        mainStack.distribution = .fillEqually
        mainStack.spacing = 8
        self.scrollView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func createScroll() {
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func cleanMainStak() {
        self.mainStack.subviews.forEach({
            $0.removeFromSuperview()
        })
    }
    
    func removeLoadView() {
        self.mainStack.subviews.forEach({
            if $0 is UIActivityIndicatorView {
                $0.removeFromSuperview()
            }
        })
    }
    
    func fillRepositories(with data: [RepositoriesViewModel]) {
        removeLoadView()
        for item in data.enumerated() {
            let cell = RepositoryViewDetail(with: item.element)
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.heightAnchor.constraint(equalToConstant: 110).isActive = true
            mainStack.addArrangedSubview(cell)
        }
    }
    
    func activityIndicator() {
        let loadingView = UIActivityIndicatorView()
        loadingView.color = .black
        loadingView.startAnimating()
        mainStack.addArrangedSubview(loadingView)
    }
}
