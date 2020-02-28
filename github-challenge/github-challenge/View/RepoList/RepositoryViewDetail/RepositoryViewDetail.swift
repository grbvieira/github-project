//
//  RepositoryViewDetail.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class RepositoryViewDetail: UIView {
    var stackDetail = UIStackView()
    var stackImage  = UIStackView()
    var stackInfo   = UIStackView()
    
    // MARK: - Cria Items para exibição
    private lazy var photo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
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
    
    private lazy var starsCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stars: CosmosView = {
        return CosmosView()
    }()
    
    // MARK: - ViewCircleLife
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init(with data: RepositoriesViewModel) {
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.setupStack()
        self.autorName.text = "Author: " + data.nameAuthor
        self.repoName.text = data.nameRepositories
        self.stars.rating = Double(data.starsCount)/2
        self.starsCount.text = "Stars: " + data.starsCountToString
        self.photo.kf.setImage(with: data.photoURL)
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
        stackInfo.alignment = .top
        stackInfo.distribution = .fill
        stackInfo.spacing = 2.0
        stackInfo.addArrangedSubview(repoName)
        stackInfo.addArrangedSubview(autorName)
        stackInfo.addArrangedSubview(starsCount)
        /*  let stackStars = UIStackView()
         stackStars.axis = .horizontal
         stackStars.alignment = .top
         stackStars.distribution = .fill
         
         stars.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
         stackStars.addArrangedSubview(stars)
         stackStars.addArrangedSubview(starsCount)
         
         stackInfo.addArrangedSubview(stackStars)*/
    }
}
