//
//  RootRouter.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

final class RootRouterImpl: RootRouter {
    private let scene: PresentScene
    // Builder

    init(scene: PresentScene) {
        self.scene = scene
    }

    func showDashboard() {
        // build & play
    }
}
