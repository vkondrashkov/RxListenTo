//
//  RootViewController.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {
    var router: RootRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple

        router.showDashboard()
    }
}
