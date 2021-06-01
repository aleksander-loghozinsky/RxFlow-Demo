//
//  InnerViewModel.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 31.05.2021.
//

import RxFlow
import RxCocoa

protocol InnerViewModelProtocol {
    var data: Driver<InnerModel> { get }
}

final class InnerViewModel: InnerViewModelProtocol {
    
    private let steps: PublishRelay<Step>
    
    let data: Driver<InnerModel>
    
    init(steps: PublishRelay<Step>, model: InnerModel) {
        self.steps = steps
        data = BehaviorRelay(value: model).asDriver()
    }
}
