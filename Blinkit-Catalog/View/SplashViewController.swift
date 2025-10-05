//
//  SplashViewController.swift
//  Blinkit-Catalog
//
//  Created by jatin foujdar on 03/10/25.
//
import UIKit
import SwiftUI

class SplashViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Blinkit"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "By - Jatin Foujdar"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        navigateToMainScreen() // ✅ Now this is called
    }

    private func setupLayout() {
        view.backgroundColor = UIColor(red: 1.0, green: 0.85, blue: 0.4, alpha: 1.0)

        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func navigateToMainScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            let categoryVC = CategoryViewController()
            let navController = UINavigationController(rootViewController: categoryVC)
            navController.modalPresentationStyle = .fullScreen
            self?.present(navController, animated: true)
        }
    }
}

    
    // MARK: - SwiftUI Preview
    
    struct SplashViewController_Previews: PreviewProvider {
        static var previews: some View {
            ViewControllerPreview {
                SplashViewController()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    /// Helper to preview UIViewControllers in SwiftUI
    struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
        let viewControllerBuilder: () -> ViewController
        
        init(_ builder: @escaping () -> ViewController) {
            self.viewControllerBuilder = builder
        }
        
        func makeUIViewController(context: Context) -> ViewController {
            viewControllerBuilder()
        }
        
        func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
    }


