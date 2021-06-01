//
//  Stepper+Extensions.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 30.05.2021.
//

import Foundation
import RxFlow
import RxSwift
import RxCocoa

private var subjectContext: UInt8 = 0

extension Stepper {
    var steps: PublishRelay<Step> {
        
        if let subject = objc_getAssociatedObject(self, &subjectContext) as? PublishRelay<Step> {
            return subject
        }
        
        let newSubject = PublishRelay<Step>()
        objc_setAssociatedObject(
            self,
            &subjectContext,
            newSubject,
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
        return newSubject
    }
}
