//
//  DashboardComponent.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class DashboardComponent {
    let searchNavigationController: UINavigationController
    let playerNavigationController: UINavigationController
    let settingsNavigationController: UINavigationController

    init(searchNavigationController: UINavigationController,
         playerNavigationController: UINavigationController,
         settingsNavigationController: UINavigationController) {
        self.searchNavigationController = searchNavigationController
        self.playerNavigationController = playerNavigationController
        self.settingsNavigationController = settingsNavigationController
    }
}
