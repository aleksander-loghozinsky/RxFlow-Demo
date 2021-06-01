//
//  AppStep.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 29.05.2021.
//

import RxFlow

enum AppStep: Step {
    // Home Flow
    case home
    // Inner Flow
    case inner(with: InnerModel)
    // Indirects
    indirect case close(AppStep)
}
