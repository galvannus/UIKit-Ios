//
//  MainTable+Delegates.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 20/08/23.
//

import UIKit

// MARK: - TableVew

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Cantidad de celdas
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configuración de la celda de la tabla
        // Del tableView reusa esta celda con e identificador MainTableViewCell.id en el indexPath
        // y casteala al tipo de celda MainTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.id, for: indexPath) as?
            MainTableViewCell else {
            fatalError("Could not cast MainTableViewCell")
        }

        cell.setUp(name: "Nombre", image: UIImage(named: "ratata")!)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Alto de la celda
        return 100
    }
}

// MARK: - CollectionView

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configuración de la celda del CollectionView
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeCollectionViewCell.id, for: indexPath) as?
            TypeCollectionViewCell else {
            fatalError("Could not cast TypeCollectionViewCell")
        }

        cell.setUp(title: "Type")
        cell.delegate = self

        return cell
    }

    // Definir ancho y alto del CollectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 45)
    }
}

// MARK: - Custom Delegates

extension MainViewController: MainTableDelegate{
    func didTypeSelect(type: String) {
        print(type)
    }
}
