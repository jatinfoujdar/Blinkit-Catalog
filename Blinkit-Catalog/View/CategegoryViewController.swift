//
//  CategegoryViewController.swift
//  Blinkit-Catalog
//
//  Created by jatin foujdar on 03/10/25.
//

import UIKit
import SwiftUI


class CategegoryViewController : UIViewController{
    
    private var selectedCategoryIndex : Int = 0
    
    private let categegoryCollectionView: UICollectionView = {
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
    
    private func setupNavigationBar(){
        title = "Sauces and Spreads"
        navigationController?.navigationBar.prefersLargeTitles = false
        
//        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backTapped))
    }
    
    private func setupUI(){
        
    }
}








struct CategegoryViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            CategegoryViewController()
        }
        .edgesIgnoringSafeArea(.all)
    }
}


