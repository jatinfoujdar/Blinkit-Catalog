//
//  CategegoryViewController.swift
//  Blinkit-Catalog
//
//  Created by jatin foujdar on 03/10/25.
//

import UIKit
import SwiftUI

class CategoryViewController: UIViewController {
    
    private var selectedCategoryIndex: Int = 0
    
    private let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let categoryListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
    }
    
    private func setupNavigationBar() {
        title = "Sauces and Spreads"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backTapped)
        )
        backButton.tintColor = .black
        
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(searchTapped)
        )
        searchButton.tintColor = .black
        
        navigationItem.leftBarButtonItems = [backButton, searchButton]
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(categoryListCollectionView)
        view.addSubview(categoryCollectionView)

        categoryListCollectionView.delegate = self
        categoryListCollectionView.dataSource = self
        categoryListCollectionView.register(CategoryListCell.self, forCellWithReuseIdentifier: "CategoryListCell")

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")

        // Add constraints here
        NSLayoutConstraint.activate([
            // Category list on left
            categoryListCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryListCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            categoryListCollectionView.widthAnchor.constraint(equalToConstant: 120),

            // Products on right
            categoryCollectionView.leadingAnchor.constraint(equalTo: categoryListCollectionView.trailingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    
    @objc private func backTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func searchTapped() {
        // Add search logic here
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryListCollectionView {
            return categories.count
        } else {
            return categories[selectedCategoryIndex].products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryListCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryListCell", for: indexPath) as! CategoryListCell
            let category = categories[indexPath.item]
            cell.configure(with: category, isSelected: indexPath.item == selectedCategoryIndex)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            let product = categories[selectedCategoryIndex].products[indexPath.item]
            cell.configure(with: product)
            cell.onProductTapped = { [weak self] in
                let detailVC = ProductDetailViewController(product: product)
                detailVC.modalPresentationStyle = .pageSheet
                
                if let sheet = detailVC.sheetPresentationController {
                    sheet.detents = [.medium(), .large()]
                    sheet.prefersGrabberVisible = true
                    sheet.preferredCornerRadius = 20
                }
                
                self?.present(detailVC, animated: true)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryListCollectionView {
            return CGSize(width: 120, height: 100)
        } else {
            let width = (collectionView.frame.width - 48) / 2
            return CGSize(width: width, height: 280)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryListCollectionView {
            selectedCategoryIndex = indexPath.item
            title = categories[indexPath.item].name
            categoryListCollectionView.reloadData()
            categoryCollectionView.reloadData()
        }
    }
}








struct CategoryViewController_Previews: PreviewProvider{
    static var previews: some View {
        ViewControllerPreview {
            CategoryViewController()
        }
        .edgesIgnoringSafeArea(.all)
    }
}


