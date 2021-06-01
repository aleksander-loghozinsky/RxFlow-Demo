//
//  InnerModel.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 29.05.2021.
//

import Foundation

typealias InnerModelType = Identifiable & Nameable

struct InnerModel: InnerModelType {
    let id: UUID
    let name: String
    
    init(from model: HomeModel) {
        id = model.id
        name = model.name
    }
}
