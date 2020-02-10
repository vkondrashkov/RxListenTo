//
//  RootRouter.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

final class RootRouterImpl: RootRouter {
    private let scene: PresentScene
    private let dashboardBuilder: DashboardBuilder

    init(scene: PresentScene,
         dashboardBuilder: DashboardBuilder) {
        self.scene = scene
        self.dashboardBuilder = dashboardBuilder
    }

    func showDashboard() {
        let view = dashboardBuilder.build()
        scene.play(view: view)
    }
}
