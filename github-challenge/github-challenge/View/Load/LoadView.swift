//
//  LoadView.swift
//  github-challenge
//
//  Created by Gerson Vieira on 25/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit

class LoadView: UIView {
    
    var stackDetail = UIStackView()
    var stackImage  = UIStackView()
    var stackInfo   = UIStackView()
    
    //MARK: - Cria Items para exibição
    private lazy var photo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 80))
        image.image = UIImage(named: "gradiente")
        return image
    }()
    
    private lazy var repoName: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 20))
        image.image = UIImage(named: "gradiente")
        return image
    }()
    
    private lazy var autorName: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 10))
        image.image = UIImage(named: "gradiente")
        return image
    }()
    
    private lazy var starsCount: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 10))
        image.image = UIImage(named: "gradiente")
        return image
    }()
    
    //MARK: - ViewCircleLife
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init() {
        super.init(frame: CGRect(x: 0, y: 0, width:10, height: 10))
        self.setupStack()
        self.autorName.startShimmering()
        self.repoName.startShimmering()
        self.starsCount.startShimmering()
        self.photo.startShimmering()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStack() {
        self.setupSackImage()
        self.setupStackInfo()
        self.setupStackDetail()
    }
    
    func setupStackDetail() {
        stackDetail.axis = .horizontal
        stackDetail.alignment = .firstBaseline
        stackDetail.distribution = .fillEqually
        stackDetail.spacing = 0
        stackDetail.addArrangedSubview(stackImage)
        stackDetail.addArrangedSubview(stackInfo)
        stackDetail.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        self.addSubview(stackDetail)
    }
    
    func setupSackImage() {
        stackImage.axis = .horizontal
        stackImage.alignment = .fill
        stackImage.distribution = .fill
        stackImage.spacing = 0
        photo.contentMode = .scaleAspectFit
        self.stackImage.addArrangedSubview(photo)
    }
    
    func setupStackInfo() {
        stackInfo.axis = .vertical
        stackInfo.alignment = .fill
        stackInfo.distribution = .fill
        stackInfo.spacing = 2.0
        
        stackInfo.addSubview(repoName)
        stackInfo.addSubview(autorName)
        stackInfo.addArrangedSubview(repoName)
        stackInfo.addArrangedSubview(autorName)
    }
}
