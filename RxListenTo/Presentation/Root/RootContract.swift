//
//  RootContract.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

protocol RootDependency {
    var window: UIWindow { get }
}

protocol RootBuilder: AnyObject {
    func build() -> UIViewController
}

protocol RootRouter: AnyObject {
    func showDashboard()
}

protocol RootViewModel { }
