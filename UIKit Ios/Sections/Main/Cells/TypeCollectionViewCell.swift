//
//  TypeCollectionViewCell.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 14/08/23.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {
    static let id = "TypeCollectionViewCell"

    lazy var typeLabel: UILabel = UILabel()

    weak var delegate: MainTableDelegate?

    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? .green : .white
            typeLabel.textColor = isSelected ? .white : .systemGreen

            if isSelected {
                delegate?.didTypeSelect(type: typeLabel.text ?? "")
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 12
        contentView.backgroundColor = .white
        // contentView.layer.borderWidth = 1.0
        // contentView.layer.borderColor = UIColor.systemGreen.cgColor

        typeLabel.textColor = .systemGreen
        typeLabel.textAlignment = .center

        setUpLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpLayout() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(typeLabel)

        // Activar constrains
        NSLayoutConstraint.activate([
            typeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            typeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    func setUp(title: String) {
        typeLabel.text = title
    }
}
