//
//  UITableView+Generic.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReuseIdentifiable {
        self.register(T.self, forCellReuseIdentifier: T.reuseId)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReuseIdentifiable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseId) at indexPath: \(indexPath)")
        }
        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReuseIdentifiable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseId) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseId)")
        }
        return cell
    }

    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReuseIdentifiable {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseId)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReuseIdentifiable {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseId) as? T else {
            fatalError("Could not dequeue header footer with identifier: \(T.reuseId)")
        }
        return cell
    }
}
