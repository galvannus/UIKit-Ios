//
//  MainViewController.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 13/08/23.
//

import UIKit

class MainViewController: UIViewController {
    // Crear e inicializar elementos de la UI

    private let titleTable: UILabel = UILabel()
    private var typeCollectionView: UICollectionView!
    private let tableView: UITableView = UITableView()

    // MARK: - Properties

    weak var coordinator: Coordinator?
    weak var context: Context?
    var viewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpView()
        setUpLayout()
    }
}

// MARK: - Private methods

extension MainViewController {
    // Configuración de elementos UI
    private func setUpView() {
        // Title Label
        titleTable.translatesAutoresizingMaskIntoConstraints = false
        titleTable.text = "TableView"
        titleTable.textColor = .systemGreen
        titleTable.textAlignment = .center
        titleTable.font = .systemFont(ofSize: 24, weight: .bold)

        // TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        // Register Cell
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.id)

        // CollectionView
        // Layout para el collection
        let horizontalLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        horizontalLayout.scrollDirection = .horizontal
        // frame: .zero por que se va a agregar por codigo la UI
        typeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: horizontalLayout)
        typeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        typeCollectionView.delegate = self
        typeCollectionView.dataSource = self
        // Register Cell
        typeCollectionView.register(TypeCollectionViewCell.self, forCellWithReuseIdentifier: TypeCollectionViewCell.id)
    }

    // Configuración de los constraints
    private func setUpLayout() {
        view.addSubview(titleTable)
        view.addSubview(tableView)
        view.addSubview(typeCollectionView)

        NSLayoutConstraint.activate([
            // Se utiliza para tomar una distancia segura de los elementos superiores view.safeAreaLayoutGuide.topAnchor
            titleTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24), // Left
            titleTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24), // Right
            titleTable.heightAnchor.constraint(equalToConstant: 40),

            typeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // Left
            typeCollectionView.topAnchor.constraint(equalTo: titleTable.bottomAnchor, constant: 12),
            typeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // Right
            typeCollectionView.heightAnchor.constraint(equalToConstant: 40),

            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // Left
            tableView.topAnchor.constraint(equalTo: typeCollectionView.bottomAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // Right
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}
