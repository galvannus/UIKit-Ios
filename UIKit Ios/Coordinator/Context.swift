//
//  Context.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 20/08/23.
//

import UIKit

class Context {
    weak var coordinator: Coordinator?
    var navigationController: UINavigationController

    init(width navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func initialize(coordinator: Coordinator) {
        self.coordinator = coordinator
        coordinator.start()
    }

    func push(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
