//
//  DashboardBuilder.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class DashboardBuilderImpl: DashboardBuilder {
    private let dependency: DashboardDependency

    init(dependency: DashboardDependency) {
        self.dependency = dependency
    }

    func build() -> UIViewController {
        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        let playerNavigationController = UINavigationController()
        playerNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)

        let settingsNavigationController = UINavigationController()
        settingsNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)

        let view = DashboardViewController()
        view.modalPresentationStyle = .fullScreen
        view.modalTransitionStyle = .crossDissolve
        view.viewControllers = [
            searchNavigationController,
            playerNavigationController,
            settingsNavigationController
        ]

        let component = DashboardComponent(
            searchNavigationController: searchNavigationController,
            playerNavigationController: playerNavigationController,
            settingsNavigationController: settingsNavigationController
        )

        let searchBuilder = SearchBuilderImpl(dependency: component)

        let searchScene = NavigationScene(parent: searchNavigationController)
        let router = DashboardRouterImpl(
            searchScene: searchScene,
            searchBuilder: searchBuilder
        )
        view.router = router
        return view
    }
}

