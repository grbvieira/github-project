//
//  BaseViewController.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class BaseViewController<CustomView: UIView>: UIViewController {
    
    var customView: CustomView {
        guard let view = view as? CustomView else { return CustomView()}
        return view
    }
    
    override func loadView() {
        view = CustomView()
    }
}
