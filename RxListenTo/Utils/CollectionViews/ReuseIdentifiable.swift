//
//  ReuseIdentifiable.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

protocol ReuseIdentifiable {
    static var reuseId: String { get }
}

extension ReuseIdentifiable where Self: UIView {
    static var reuseId: String {
        return String(describing: self)
    }
}
