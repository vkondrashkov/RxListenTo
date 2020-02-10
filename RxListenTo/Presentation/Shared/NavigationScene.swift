//
//  NavigationScene.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

class NavigationScene {
    let parent: UINavigationController

    init(parent: UINavigationController) {
        self.parent = parent
    }

    func play(view: UIViewController) {
        parent.pushViewController(view, animated: true)
    }

    func stop() {
        parent.popViewController(animated: true)
    }
}
