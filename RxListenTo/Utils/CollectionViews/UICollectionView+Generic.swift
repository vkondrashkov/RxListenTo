//
//  UICollectionView+Generic.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReuseIdentifiable {
        self.register(T.self, forCellWithReuseIdentifier: T.reuseId)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReuseIdentifiable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseId) at indexPath: \(indexPath)")
        }
        return cell
    }

    func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind elementKind: String) where T: ReuseIdentifiable {
        self.register(T.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: T.reuseId)
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, for indexPath: IndexPath) -> T where T: ReuseIdentifiable {
        guard let cell = self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: T.reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue supplementary view with identifier: \(T.reuseId) at indexPath: \(indexPath)")
        }
        return cell
    }
}
