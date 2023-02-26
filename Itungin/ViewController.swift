//
//  ViewController.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 19/02/23.
//

import UIKit

class ViewController: UIViewController {

    private let categoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Category", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        
        view.addSubview(categoryButton)
        
        categoryButton.addTarget(self, action: #selector(showCategorySheet), for: .touchUpInside)
        
        configureConstraints()
    }
    
    @objc private func showCategorySheet(){
        print("clicked")
        
        let categoryControllerSheet = CategoryViewController()
        if let presentationController = categoryControllerSheet.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        present(categoryControllerSheet, animated: true)
        
    }
    
    private func configureConstraints(){
        let categoryButtonConstraints = [
            categoryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            categoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(categoryButtonConstraints)
    }


}

