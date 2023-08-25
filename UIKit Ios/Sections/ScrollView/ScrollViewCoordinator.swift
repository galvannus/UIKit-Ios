//
//  ScrollViewCoordinator.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 21/08/23.
//

class ScrollViewCoordinator: Coordinator {
    var context: Context?

    init(context: Context) {
        self.context = context
    }

    func start() {
        let viewController = ScrollViewViewController()
        // viewController.viewModel = BasicComponentsViewModel()
        viewController.coordinator = self
        viewController.context = context
        context?.push(viewController: viewController)
    }
}
