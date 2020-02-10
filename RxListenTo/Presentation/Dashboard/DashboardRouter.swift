//
//  DashboardRouter.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

final class DashboardRouterImpl: DashboardRouter{
    private let searchScene: NavigationScene
    private let searchBuilder: SearchBuilder
    // Builder

    init(searchScene: NavigationScene,
         searchBuilder: SearchBuilder) {
        self.searchScene = searchScene
        self.searchBuilder = searchBuilder
    }

    func showSearch() {
        let view = searchBuilder.build()
        searchScene.play(view: view)
    }

    func showPlayer() {

    }

    func showSettings() {
        
    }
}
