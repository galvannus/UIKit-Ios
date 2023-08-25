//
//  BasicComponentsCoordinator.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 21/08/23.
//

class BasicComponentsCoordinator: Coordinator {
    var context: Context?

    init(context: Context) {
        self.context = context
    }

    func start() {
        let viewController = BasicComponentsViewController()
        // viewController.viewModel = BasicComponentsViewModel()
        viewController.coordinator = self
        viewController.context = context
        context?.push(viewController: viewController)
    }
}
