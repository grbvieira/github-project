//
//  LoadView.swift
//  github-challenge
//
//  Created by Gerson Vieira on 25/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class LoadView: NibView {
    
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var repoNameView: UIView!
    @IBOutlet weak var authorNameView: UIView!
    @IBOutlet weak var starsNameView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        photoView.startShimmering()
        repoNameView.startShimmering()
        authorNameView.startShimmering()
        starsNameView.startShimmering()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
