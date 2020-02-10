//
//  RootBuilder.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class RootBuilderImpl: RootBuilder {
    private let dependency: RootDependency

    init(dependency: RootDependency) {
        self.dependency = dependency
    }

    func build() -> UIViewController {
        let view = RootViewController()
        let component = RootComponent(rootViewController: view)
        let dashboardBuilder = DashboardBuilderImpl(dependency: component)
        let scene = PresentScene(parent: view)
        let router = RootRouterImpl(
            scene: scene,
            dashboardBuilder: dashboardBuilder
        )
        view.router = router
        return view
    }
}
