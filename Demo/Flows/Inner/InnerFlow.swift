//
//  InnerFlow.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 30.05.2021.
//

import UIKit
import RxFlow

final class InnerFlow: NSObject, Flow {
    
    private let innerModel: InnerModel
    lazy var initialViewController: InnerViewController = {
        let controller = InnerViewController(nibName: InnerViewController.identifier)
        controller.viewModel = InnerViewModel(steps: steps, model: innerModel)
        
        return controller
    }()
    
    var root: Presentable {
        initialViewController
    }
    
    init(model: InnerModel) {
        innerModel = model
        super.init()
        
        bind()
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .close(let step):
            switch step {
            case .inner:
                return closeInnerFlow()
            default:
                return .none
            }
        default:
            return .none
        }
    }
    
    func bind() {
        rxDismissed
            .subscribe { [unowned self] _ in
                steps.accept(AppStep.close(.inner(with: innerModel)))
            }
            .disposed(by: disposeBag)
    }
}

private extension InnerFlow {
    
    func closeInnerFlow() -> FlowContributors {
        .end(forwardToParentFlowWithStep: AppStep.home)
    }
}

extension InnerFlow: Stepper {}
