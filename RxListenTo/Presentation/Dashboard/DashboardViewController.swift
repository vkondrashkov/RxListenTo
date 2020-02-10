//
//  DashboardViewController.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class DashboardViewController: UITabBarController {
    var router: DashboardRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple

        router.showSearch()
        router.showPlayer()
        router.showSettings()
    }
}
