//
//  SearchBuilder.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class SearchBuilderImpl: SearchBuilder {
    private let dependency: SearchDependency

    init(dependency: SearchDependency) {
        self.dependency = dependency
    }

    func build() -> UIViewController {
        let view = SearchViewController()
//        let component = SearchComponent()
        let scene = NavigationScene(parent: dependency.searchNavigationController)
        let router = SearchRouterImpl(scene: scene)
        view.router = router
        return view
    }
}
