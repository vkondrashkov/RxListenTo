//
//  WindowScene.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

final class WindowScene {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func play(view: UIViewController) {
        window.rootViewController = view
        window.makeKeyAndVisible()
    }
}
