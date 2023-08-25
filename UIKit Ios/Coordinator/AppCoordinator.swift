//
//  AppCoordinator.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 20/08/23.
//

class AppCoordinator: Coordinator {
    var context: Context?

    init(context: Context) {
        self.context = context
    }

    func start() {
        let viewController = LoginViewController()
        viewController.viewModel = LoginViewModel()
        viewController.coordinator = self
        viewController.context = context
        context?.push(viewController: viewController)
    }
}
