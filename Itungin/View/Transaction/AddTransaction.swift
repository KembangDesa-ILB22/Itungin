//
//  AddTransaction.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 05/03/23.
//

import UIKit

class AddTransaction: UIViewController {
    
    private let formTableView: UITableView = {
       let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    private lazy var categoryTableViewCell: SelectCategoryTableViewCell = {
       let cell = SelectCategoryTableViewCell()
        return cell
    }()
    
    private lazy var notesTableViewCell: FilledTableViewCell = {
       let cell = FilledTableViewCell()
        cell.titleLabel.text = "Notes"
        cell.fillTextField.placeholder = "Enter Notes"
        cell.fillTextField.keyboardType = .default
        return cell
    }()
    
    private lazy var amountTableViewCell: FilledTableViewCell = {
       let cell = FilledTableViewCell()
        cell.titleLabel.text = "Amount"
        cell.fillTextField.placeholder = "100000"
        cell.fillTextField.keyboardType = .numberPad
        return cell
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        view.addSubview(formTableView)
        formTableView.dataSource = self
        formTableView.delegate = self
     
        configureConstraints()
    }
    
    private func configureConstraints(){
        let formTableViewConstraints = [
            formTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formTableView.topAnchor.constraint(equalTo: view.topAnchor),
            formTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(formTableViewConstraints)
    }
}

extension AddTransaction: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch(indexPath.row) {
        case 0: return self.categoryTableViewCell
        case 1: return self.amountTableViewCell
        case 2: return self.notesTableViewCell
            default: return UITableViewCell()
        }
    }
    
    
}
