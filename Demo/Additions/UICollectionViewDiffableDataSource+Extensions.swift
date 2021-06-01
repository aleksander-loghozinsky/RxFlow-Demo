//
//  UICollectionViewDiffableDataSource+Extensions.swift
//  Demo
//
//  Created by Aleksander Loghozinsky on 01.06.2021.
//

import UIKit

enum SingleSection { case main }

extension UICollectionViewDiffableDataSource where SectionIdentifierType == SingleSection {
    
    func applyItems(_ items: [ItemIdentifierType], completion: (() -> Void)? = nil) {
        var snapshot = NSDiffableDataSourceSnapshot<SingleSection, ItemIdentifierType>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        apply(snapshot, completion: completion)
    }
}
