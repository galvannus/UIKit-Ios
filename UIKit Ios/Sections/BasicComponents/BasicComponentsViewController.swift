//
//  BasicComponentsViewController.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 13/08/23.
//

import UIKit

class BasicComponentsViewController: UIViewController {
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My label"
        label.textColor = .green
        label.textAlignment = .center

        return label
    }()

    private let mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("My button", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)

        return button
    }()

    private let mainSwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    // MARK: - Properties

    weak var coordinator: Coordinator?
    weak var context: Context?
    //var viewModel: BasicComponentsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        [mainLabel, mainButton, mainSwitch].forEach { view.addSubview($0) }

        mainLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mainLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        mainButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true

        mainSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
    }
}
