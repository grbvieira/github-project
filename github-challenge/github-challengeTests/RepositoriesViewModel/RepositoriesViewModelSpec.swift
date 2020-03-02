//
//  RepositoriesViewModelSpec.swift
//  github-challengeTests
//
//  Created by Gerson Vieira on 28/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Quick
import Nimble
@testable import github_challenge

class RepositoriesViewModelSpec: QuickSpec {
    
    override func spec() {
        var repoArray: [RepositoriesViewModel] = []
        var response: RepositoriesModel?
        beforeEach {
            response = Mock().getMock()
            repoArray = FillViewModel().wrapToViewModel(model: response!)
        }
        
        describe("Fill ViewModel") {
            
            context("fills array with wrapToViewModel function"){
                it("repoArray should be greater than zero") {
                    repoArray = []
                    repoArray = FillViewModel().wrapToViewModel(model: response!)
                    expect(repoArray.count > 0).to(beTrue())
                }
            }
            
            context("should return the expected type") {
                it("nameRepositories should be String") {
                    expect(repoArray[0].nameRepositories is String).to(beTrue())
                }
                
                it("nameAuthor should be String") {
                    expect(repoArray[0].nameAuthor is String).to(beTrue())
                }
                
                it("photoURL should be URL") {
                    expect(repoArray[0].photoURL is URL).to(beTrue())
                }
                
                it("starsCount should be Int") {
                    expect(repoArray[0].starsCount is Int).to(beTrue())
                }
                
                it("starsCountToString should be String") {
                    expect(repoArray[0].starsCountToString is String).to(beTrue())
                }
            }
        }
    }
    
}
