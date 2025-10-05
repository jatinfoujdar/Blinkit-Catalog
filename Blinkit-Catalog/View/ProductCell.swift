//
//  ProductCell.swift
//  Blinkit-Catalog
//
//  Created by jatin foujdar on 05/10/25.
//

import UIKit
import SwiftUI

class ProductCell: UICollectionViewCell {
    
    static let identifier = "ProductCell"
    var onProductTapped: (() -> Void)?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
            contentView.addSubview(containerView)
            containerView.addSubview(productImageView)
            containerView.addSubview(nameLabel)
            containerView.addSubview(priceLabel)
            containerView.addSubview(addButton)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
            containerView.addGestureRecognizer(tapGesture)
            
            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                productImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
                productImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                productImageView.widthAnchor.constraint(equalToConstant: 120),
                productImageView.heightAnchor.constraint(equalToConstant: 120),
                
                nameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 12),
                nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
                
                priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                
                addButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 12),
                addButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
                addButton.widthAnchor.constraint(equalToConstant: 80),
                addButton.heightAnchor.constraint(equalToConstant: 32)
            ])
        }

    @objc private func cellTapped() {
            onProductTapped?()
        }


    func configure(with product: Product) {
        nameLabel.text = product.name
        priceLabel.text = "₹\(product.price)"
        productImageView.image = UIImage(named: product.image) ?? UIImage(systemName: "photo") // fallback image
    }
}






