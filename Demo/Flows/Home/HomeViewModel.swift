//
//  HomeViewModel.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 31.05.2021.
//

import RxFlow
import RxSwift
import RxCocoa

protocol HomeViewModelProtocol {
    var data: Observable<[HomeModel]> { get }
    
    func onSelect(_ model: HomeModel)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let steps: PublishRelay<Step>
    
    let data: Observable<[HomeModel]>
    
    private let dataRelay = BehaviorRelay<[HomeModel]>(value: [])
    
    private let mokData = [HomeModel(name: "Sasha"), HomeModel(name: "Kate")]
    
    init(steps: PublishRelay<Step>) {
        self.steps = steps
        
        data = dataRelay.asObservable()
        
        dataRelay.accept(mokData)
    }
    
    func onSelect(_ model: HomeModel) {
        let model = InnerModel(from: model)
        steps.accept(AppStep.inner(with: model))
    }
}
