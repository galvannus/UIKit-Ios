//
//  ScrollViewViewController.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 18/08/23.
//

import UIKit

class ScrollViewViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0

        return stackView
    }()

    private let container1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true

        return view
    }()

    private let container2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        view.heightAnchor.constraint(equalToConstant: 800).isActive = true

        return view
    }()

    private let container3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true

        return view
    }()

    // MARK: - Properties

    weak var coordinator: Coordinator?
    weak var context: Context?
    // var viewModel: BasicComponentsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpView()
    }

    private func setUpView() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // El ancho del stack será el mismo que el del scrollView
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

        stackView.addArrangedSubview(container1)
        stackView.addArrangedSubview(container2)
        stackView.addArrangedSubview(container3)

        // Cuando cargue hasta aqui, espera 4 segundos y ejecuta esto
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.container2.isHidden = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.container2.isHidden = false
            }
        }
    }
}
