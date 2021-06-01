//
//  AppFlow.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 29.05.2021.
//

import UIKit
import RxFlow

final class AppFlow: Flow {
    
    lazy var initialViewController = AppNavigationViewController()
    
    var root: Presentable {
        initialViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .home:
            return navigateHome()
        default:
            return .none
        }
    }
    
    private func navigateHome() -> FlowContributors {
        weak var weakSelf = self
        let flow = HomeFlow()
        
        Flows.use(flow, when: .created) { (root) in
            weakSelf?.initialViewController.viewControllers = [root]
        }
        
        return .one(
            flowContributor:
                .contribute(
                    withNextPresentable: flow,
                    withNextStepper: flow
                )
        )
    }
}

extension AppFlow: Stepper {
    
    var initialStep: Step {
        AppStep.home
    }
}
