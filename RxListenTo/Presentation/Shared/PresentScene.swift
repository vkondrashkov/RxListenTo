//
//  PresentScene.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

class PresentScene {
    let parent: UIViewController

    init(parent: UIViewController) {
        self.parent = parent
    }

    func play(view: UIViewController) {
        parent.present(view, animated: true, completion: nil)
    }

    func stop() {
        parent.dismiss(animated: true, completion: nil)
    }
}
