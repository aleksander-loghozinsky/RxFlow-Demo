//
//  Model.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 29.05.2021.
//

import Foundation

typealias HomeModelType = Identifiable & Nameable

struct HomeModel: HomeModelType {
    let id = UUID()
    let name: String
    
    lazy var submodel = HomeSubmodel(name: name)
}

struct HomeSubmodel: Nameable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
