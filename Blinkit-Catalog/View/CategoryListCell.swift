//
//  CategoryListCell.swift
//  Blinkit-Catalog
//
//  Created by jatin foujdar on 05/10/25.
//

import UIKit
import SwiftUI

class CategoryListCell: UICollectionViewCell {
    static let identifier = "CategoryListCell"

    // MARK: - UI Components

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let selectionIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true // default
        return view
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    // MARK: - Setup

    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true

        contentView.addSubview(selectionIndicator)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
       

        NSLayoutConstraint.activate([
            selectionIndicator.heightAnchor.constraint(equalToConstant: 6),
            selectionIndicator.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            selectionIndicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            selectionIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),

            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            nameLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),

            
        ])
    }

    // MARK: - Public Configuration

    func configure(with category: Category, isSelected: Bool) {
        imageView.image = UIImage(named: category.image)
        nameLabel.text = category.name // ✅ Use the correct label
        contentView.backgroundColor = isSelected ? .systemYellow : .white
        
    }

    
}


