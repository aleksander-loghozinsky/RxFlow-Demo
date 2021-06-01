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
                onAnimate(data.name)
            })
            .disposed(by: disposeBag)
    }
    
    private func onAnimate(_ title: String) {
        title.forEach { char in
            put(of: char, in: view.frame)
        }
    }
    
    private func put(of char: Character, in frame: CGRect) {
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 25, height: 25)))
        label.attributedText = NSAttributedString(
            string: String(char),
            attributes: [
                .foregroundColor: UIColor.randomColor,
                .font: UIFont.systemFont(ofSize: CGFloat.random(in: 15 ..< 21))
            ]
        )
        view.addSubview(label)
        UIView.animate(withDuration: 1, animations: {
            label.frame.origin = self.randomCoordinate(in: self.view.frame.size)
        })
    }
    
    private func randomCoordinate(in point: CGSize) -> CGPoint {
        let x: CGFloat = CGFloat.random(in: 0 ..< point.width)
        let y: CGFloat = CGFloat.random(in: 0 ..< point.height)
        return CGPoint(x: x, y: y)
    }

}
