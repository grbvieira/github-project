//
//  RepositoryViewDetail.swift
//  github-challenge
//
//  Created by Gerson Vieira on 17/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryViewDetail: UIView {
    var stackDetail = UIStackView()
    var stackImage  = UIStackView()
    var stackInfo   = UIStackView()
    var stackStar = UIStackView()
    
    // MARK: - Cria Items para exibição
    private lazy var photo: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        return image
    }()
    
    private lazy var repoName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var autorName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var starsImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        image.image = UIImage(named: "star")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var starsCount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var forksImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        image.image = UIImage(named: "forks")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var forksCount: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
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
        self.starsCount.text = formatPoints(from: data.starsCount)
        self.forksCount.text = formatPoints(from: data.forksCount)
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
        stackDetail.alignment = .fill
        stackDetail.distribution = .fillEqually
        stackDetail.spacing = 16
        stackDetail.addArrangedSubview(stackImage)
        stackDetail.addArrangedSubview(stackInfo)
        self.addSubview(stackDetail)
        stackDetail.frame = CGRect(x: 0, y: 16, width: UIScreen.main.bounds.width, height: 100)
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
        setupStackStar()
        stackInfo.axis = .vertical
        stackInfo.alignment = .top
        stackInfo.distribution = .fill
        stackInfo.spacing = 2.0
        stackInfo.addArrangedSubview(repoName)
        stackInfo.addArrangedSubview(autorName)
        stackInfo.addArrangedSubview(stackStar)
    }
    
    func setupStackStar() {
        stackStar.axis = .horizontal
        stackStar.alignment = .fill
        stackStar.distribution = .fillEqually
        stackStar.spacing = 0
        stackStar.addArrangedSubview(starsImage)
        stackStar.addArrangedSubview(starsCount)
        stackStar.addArrangedSubview(forksImage)
        stackStar.addArrangedSubview(forksCount)
    }
    
    func formatPoints(from: Int) -> String {
        
        let number = Double(from)
        let thousand = number / 1000
        let million = number / 1000000
        let billion = number / 1000000000
        
        if billion >= 1.0 {
            return "\(round(billion*10)/10)B"
        } else if million >= 1.0 {
            return "\(round(million*10)/10)M"
        } else if thousand >= 1.0 {
            return ("\(round(thousand*10/10))K")
        } else {
            return "\(Int(number))"
        }
    }
}
