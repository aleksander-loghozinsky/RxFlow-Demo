//
//  HomeViewController.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 28.05.2021.
//

import UIKit
import RxSwift

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        bindView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func configureTableView() {
        tableView.register(
            UINib(
                nibName: HomeItemTableViewCell.identifier
            ),
            forCellReuseIdentifier: HomeItemTableViewCell.reuseIdentifier
        )
        
        tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    private func bindView() {
        rx.methodInvoked(#selector(viewDidAppear))
            .take(1)
            .subscribe(onNext: { [unowned self] _ in
                bindViewModel()
            })
            .disposed(by: disposeBag)
        
        tableView
            .rx
            .modelSelected(HomeModel.self)
            .bind { [unowned self] model in
                viewModel.onSelect(model)
            }
            .disposed(by: disposeBag)
    }
    
    private func bindViewModel() {
        viewModel
            .data
            .bind(to: tableView.rx.items(
                cellIdentifier: HomeItemTableViewCell.reuseIdentifier,
                cellType: HomeItemTableViewCell.self
            )) { (index, model, cell) in
                cell.configure(with: model)
            }
            .disposed(by: disposeBag)
    }

}

extension HomeViewController: UIScrollViewDelegate {}

