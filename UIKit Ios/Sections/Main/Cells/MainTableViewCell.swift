//
//  MainTableViewCell.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 13/08/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let id = "MainTableViewCellId"

    var logoImage: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .white // contentVew la vista general

        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpView() {
        // Configuración de elementos UI
        logoImage.contentMode = .scaleAspectFit

        titleLabel.textColor = .systemGreen
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)

        // Agregar nuevos items a la vista y aregar configuracion
        [logoImage, titleLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        // Configuración de los constraints
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            logoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 60),
            logoImage.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor, constant: 9),
            titleLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    // Configuración de los elementos de la celda
    func setUp(name: String, image: UIImage) {
        logoImage.image = image
        logoImage.layer.cornerRadius = 30 // Borde del elemento
        logoImage.clipsToBounds = true // Activar bordes

        titleLabel.text = name
    }
}
