//
//  RepositoriesViewModel.swift
//  github-challenge
//
//  Created by Gerson Vieira on 18/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Foundation

class RepositoriesViewModel {
    private var entry: Item?
    
    init(entry: Item) {
        self.entry = entry
    }
    
    var nameRepositories: String {
        let name = entry?.name ?? String()
        return name
    }
    
    var nameAuthor: String {
        let name = entry?.owner?.login ?? String()
        return name
    }
    
    var photoURL: URL {
        let path = entry?.owner?.avatarURL
        let photoURL = URL(string: path!)!
        return photoURL
    }
    
    var starsCount: Int {
        let count = entry?.stargazersCount ?? 0
        return count
    }
    
    var forksCount: Int {
        let count = entry?.forksCount ?? 0
        return count
    }
}

class FillViewModel {
    func wrapToViewModel(model: RepositoriesModel) -> [RepositoriesViewModel] {
        var repositories = [RepositoriesViewModel]()
        guard let items = model.items else {
            return repositories
        }
        for item in items {
            let viewModel = RepositoriesViewModel(entry: item)
            repositories.append(viewModel)
        }
        return repositories
    }
}
