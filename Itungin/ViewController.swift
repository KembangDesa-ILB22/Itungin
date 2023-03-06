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
    
    private let testView = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        
        view.addSubview(categoryButton)
        view.addSubview(testView)
        
        categoryButton.addTarget(self, action: #selector(showCategorySheet), for: .touchUpInside)
        
        configureConstraints()
        
        let dbManager = DatabaseManager.shared
        dbManager.saveTransaction()
        dbManager.readTransaction()
    }
    
    override func viewDidLayoutSubviews() {
        print("test")
    }
    
    @objc private func showCategorySheet(){
        print("clicked")
        
//        let categoryControllerSheet = CategoryViewController()
//        if let presentationController = categoryControllerSheet.presentationController as? UISheetPresentationController {
//            presentationController.detents = [.medium()]
//        }
//        present(categoryControllerSheet, animated: true)
        
        let addTransaction = AddTransactionViewController()
        present(addTransaction, animated: true)
        
    }
    
    private func configureConstraints(){
        let categoryButtonConstraints = [
            categoryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            categoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(categoryButtonConstraints)
    }


}

