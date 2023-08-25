//
//  MainViewCoordinator.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 22/08/23.
//

class MainViewCoordinator: Coordinator {
    var context: Context?

    init(context: Context) {
        self.context = context
    }

    func start() {
        let viewController = MainViewController()
        viewController.viewModel = MainViewModel()
        viewController.coordinator = self
        viewController.context = context
        context?.push(viewController: viewController)
    }
}
