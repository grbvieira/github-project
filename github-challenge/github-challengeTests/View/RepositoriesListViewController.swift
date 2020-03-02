//
//  RepositoriesListViewController.swift
//  github-challengeTests
//
//  Created by Gerson Vieira on 02/03/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import github_challenge

class RepositoriesListViewControllerSpec: QuickSpec {
    
    override func spec() {
        var controller: RepositoriesListViewController?
        var response: RepositoriesModel?
        beforeEach {
            controller = RepositoriesListViewController()
            response = Mock().getMock()
        }
        
        describe("RepositoriesListViewControllerSpec") {
            context("Request sucess") {
                it("show repositories") {
                    controller?.repositoriesResponse = .success([response!])
                    controller?.reloadStack()
                    expect(controller?.customView.mainStack.subviews.count).to(be(31))
                }
            }
            context("Request Faile") {
                it("Remove loadingView"){
                    var hasUIActivityIndicatorView = true
                    controller?.repositoriesResponse = .failure("Generic")
                    controller?.reloadStack()
                    controller?.customView.mainStack.subviews.forEach({
                        if $0 is UIActivityIndicatorView {
                            hasUIActivityIndicatorView = false
                        }
                        
                    })
                    expect(hasUIActivityIndicatorView).to(beFalse())
                }
            }
        }
    }
}
