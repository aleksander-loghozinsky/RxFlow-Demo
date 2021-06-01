//
//  HomeFlow.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 30.05.2021.
//

import UIKit
import RxFlow

final class HomeFlow: NSObject, Flow {
    
    lazy var initialViewController: HomeViewController = {
        let controller = HomeViewController(nibName: HomeViewController.identifier)
        controller.viewModel = HomeViewModel(steps: steps)
        
        return controller
    }()
    
    var root: Presentable {
        initialViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .inner(let model):
            return openInnerFlow(with: model)
        default:
            return .none
        }
    }
}

private extension HomeFlow {
    
    func openInnerFlow(with model: InnerModel) -> FlowContributors {
        weak var weakSelf = self
        let flow = InnerFlow(model: model)
        
        Flows.use(flow, when: .created) { (root) in
            weakSelf?.initialViewController.navigationController?.pushViewController(root, animated: true)
        }
        
        return .one(
            flowContributor: .contribute(
                withNext: flow
            )
        )
    }
}

extension HomeFlow: Stepper {
    
    var initialStep: Step {
        AppStep.home
    }
}
