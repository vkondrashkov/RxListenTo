//
//  RootBuilder.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

class RootBuilderImpl: RootBuilder {
    private let dependency: RootDependency

    init(dependency: RootDependency) {
        self.dependency = dependency
    }

    func build() -> UIViewController {
        let view = RootViewController()
        let component = RootComponent()
        // builder
        let scene = PresentScene(parent: view)
        let router = RootRouterImpl(scene: scene)
        view.router = router
        return view
    }
}
