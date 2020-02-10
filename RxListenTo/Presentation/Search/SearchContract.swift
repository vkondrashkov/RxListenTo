//
//  SearchContract.swift
//  RxListenTo
//
//  Created by Vladislav Kondrashkov on 2/10/20.
//  Copyright © 2020 vkondrashkov. All rights reserved.
//

import UIKit

protocol SearchDependency {
    var searchNavigationController: UINavigationController { get }
}

protocol SearchBuilder: AnyObject {
    func build() -> UIViewController
}

protocol SearchRouter: AnyObject { }
