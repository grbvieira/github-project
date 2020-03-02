//
//  Mock.swift
//  github-challengeTests
//
//  Created by Gerson Vieira on 28/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit
@testable import github_challenge
class Mock {
    
    func getMock() -> RepositoriesModel?{
        if let path = Bundle.main.path(forResource: "repoMock", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let response = try  JSONDecoder().decode(RepositoriesModel.self, from: data)
                return response
            } catch {
                fatalError("Não foi possivel ler o json")
            }
        }
        return nil
    }
}
