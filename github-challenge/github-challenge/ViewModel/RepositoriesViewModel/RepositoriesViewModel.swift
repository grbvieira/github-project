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
}
