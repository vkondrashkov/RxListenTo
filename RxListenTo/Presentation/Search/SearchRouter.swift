//
//  SearchRouter.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

final class SearchRouterImpl: SearchRouter{
    private let scene: NavigationScene

    init(scene: NavigationScene) {
        self.scene = scene
    }
}
