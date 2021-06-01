//
//  NSObject+Extensions.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 30.05.2021.
//

import Foundation
import RxSwift

public extension NSObject {
    
    static var identifier: String {
        String(describing: self)
    }
}

/* Implementation of the Rx DisposeBag for the NSObject */
extension NSObject: HasDisposeBag {}

protocol HasDisposeBag {
    var disposeBag: DisposeBag { get }
}

private struct AssociatedKeys {
    static var disposeBag = "pk_disposeBag"
}

extension HasDisposeBag {
    
    var disposeBag: DisposeBag {
        get {
            if let disposeBag = objc_getAssociatedObject(self, &AssociatedKeys.disposeBag) as? DisposeBag {
                return disposeBag
            }
            objc_setAssociatedObject(self, &AssociatedKeys.disposeBag, DisposeBag(), .OBJC_ASSOCIATION_RETAIN)
            return self.disposeBag
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disposeBag, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
