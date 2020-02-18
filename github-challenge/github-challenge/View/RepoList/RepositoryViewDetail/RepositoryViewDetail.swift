//
//  RepositoryViewDetail.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class RepositoryViewDetail: NibView {
    
    var stackDetail = UIStackView()
    var stackImage  = UIStackView()
    var stackInfo   = UIStackView()
    
    //MARK: - Cria Items para exibição
    private lazy var photo: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        return image
    }()
    
    private lazy var repoName: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var autorName: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - ViewCircleLife
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupStack()
    }
    
    required init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupStack() {
        self.setupStackDetail()
        self.setupSackImage()
        self.setupStackInfo()
        
        //MARK: - Configura items na stack
        stackImage.addArrangedSubview(photo)
        stackInfo.addArrangedSubview(repoName)
        stackInfo.addArrangedSubview(autorName)
        
    }
    
    func setupStackDetail() {
        stackDetail.axis = .horizontal
        stackDetail.alignment = .fill
        stackDetail.distribution = .fill
        stackDetail.spacing = 2.0
    }
    
    func setupSackImage() {
        stackImage.axis = .vertical
        stackImage.alignment = .fill
        stackImage.distribution = .fill
        stackImage.spacing = 2.0
    }
    
    func setupStackInfo() {
        stackInfo.axis = .vertical
        stackInfo.alignment = .fill
        stackInfo.distribution = .fill
        stackInfo.spacing = 2.0
    }
}
