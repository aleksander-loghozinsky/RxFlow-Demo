//
//  InnerViewController.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 29.05.2021.
//

import UIKit

final class InnerViewController: UIViewController {
    
    var viewModel: InnerViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bindView()
    }
    
    private func bindView() {
        rx.methodInvoked(#selector(viewWillAppear))
            .take(1)
            .subscribe(onNext: { [unowned self] _ in
                bindViewModel()
            })
            .disposed(by: disposeBag)
    }
    
    private func bindViewModel() {
        viewModel
            .data
            .drive(onNext: { [unowned self] (data) in
                let name = data.name
                title = name
            })
            .disposed(by: disposeBag)
    }

}
