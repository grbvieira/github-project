//
//  RepositoriesManager.swift
//  github-challenge
//
//  Created by Gerson Vieira on 18/02/20.
//  Copyright © 2020 Gerson Vieira. All rights reserved.
//

import Foundation
protocol RepositoriesManagerDelegate {
    func didFetch(_ data: RepositoriesModel)
    func errorToFetch(_ error: String)
}

class RepositoriesManager: NSObject {
    
    lazy var business: RepositoriesBusiness = RepositoriesBusiness(delegate: self)
    var delegate: RepositoriesManagerDelegate?
    
    init(delegate: RepositoriesManagerDelegate? = nil){
        super.init()
        self.delegate = delegate
    }
    
    func getProperties(){
        self.business.requestRepositories()
    }
}

extension RepositoriesManager: RepositoriesBusinessDelegate {
    func didFetch(_ data: RepositoriesModel) {
        
    }
    
    func errorToFetch(_ error: String) {
        
    }
    
    
}

/*extension PropertiesManager: PropertiesBusinessDelegate{
    func didFetch(_ data: Welcome) {
        let propeties = wrapToViewModel(model: data)
        self.delegate?.didFetch(propeties)
    }
    
    func errorToFetch(_ error: String) {
        self.delegate?.errorToFetch(error)
    }
    
    func wrapToViewModel(model: Welcome) -> [PropertiesViewModel]{
        var properties = [PropertiesViewModel]()
        
        for item in model {
            if valid(data: item){
                let property = PropertiesViewModel(entry: item)
                properties.append(property)
            }
        }
        
        return properties
    }
*/
