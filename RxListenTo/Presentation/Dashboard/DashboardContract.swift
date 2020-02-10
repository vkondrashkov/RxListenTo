//
//  DashboardContract.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

protocol DashboardDependency {
    var rootViewController: UIViewController { get }
}

protocol DashboardBuilder: AnyObject {
    func build() -> UIViewController
}

protocol DashboardRouter: AnyObject {
    func showSearch()
    func showPlayer()
    func showSettings()
}

protocol DashboardViewModel { }
