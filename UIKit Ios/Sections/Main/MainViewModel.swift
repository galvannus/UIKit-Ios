//
//  MainViewModel.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 22/08/23.
//

import UIKit

class MainViewModel {
    private var items: [Item] = []

    func getTitle() -> String {
        return "Main View"
    }

    func numberOfRows() -> Int {
        return items.count
    }

    func item(at indexPath: IndexPath) -> Item {
        return items[indexPath.row]
    }

    func loadItems(completion: @escaping () -> Void) {
        items = [
            Item(title: "Basic components", image: UIImage(named: "ratata")!, type: .basic),
            Item(title: "StackView", image: UIImage(named: "ratata")!, type: .stackView),
            Item(title: "ScrollView", image: UIImage(named: "ratata")!, type: .stackScrollView),
        ]

        completion()
    }
}
