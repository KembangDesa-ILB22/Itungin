//
//  AddTransaction.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 05/03/23.
//

import UIKit

class AddTransactionViewController: UIViewController {
    
    private let formTableView: UITableView = {
       let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    private lazy var categoryTableViewCell: SelectCategoryTableViewCell = {
       let cell = SelectCategoryTableViewCell()
        cell.selectionStyle = .none
        return cell
    }()
    
    private lazy var notesTableViewCell: FilledTableViewCell = {
       let cell = FilledTableViewCell()
        cell.titleLabel.text = "Notes"
        cell.fillTextField.placeholder = "Enter Notes"
        cell.fillTextField.keyboardType = .default
        cell.selectionStyle = .none
        return cell
    }()
    
    private lazy var dateTableViewCell: SelectDateTableViewCell = {
       let cell = SelectDateTableViewCell()
        cell.titleLabel.text = "Date"
        cell.selectionStyle = .none
        return cell
    }()
    
    private lazy var amountTableViewCell: FilledTableViewCell = {
       let cell = FilledTableViewCell()
        cell.titleLabel.text = "Amount"
        cell.fillTextField.placeholder = "100000"
        cell.fillTextField.keyboardType = .numberPad
        cell.selectionStyle = .none
        return cell
    }()
    
    private lazy var recurrTableViewCell: RecurrenceTableViewCell = {
        let cell = RecurrenceTableViewCell()
        cell.titleLabel.text = "Recurrence"
        cell.selectionStyle = .none
        
        return cell
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add Transaction"
        
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(backButton)
        view.addSubview(saveButton)
        view.addSubview(titleLabel)
        view.addSubview(formTableView)
        formTableView.dataSource = self
        formTableView.delegate = self
     
        configureConstraints()
    }
    
    private func configureConstraints(){
        
        let backButtonConstraints = [
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
//            backButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let saveButtonConstraints = [
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            saveButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor)
        ]
        
        let titleLabelConstraints = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor)
        ]
        
        let formTableViewConstraints = [
            formTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            formTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            formTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 8),
            formTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(formTableViewConstraints)
        NSLayoutConstraint.activate(backButtonConstraints)
        NSLayoutConstraint.activate(saveButtonConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
}

extension AddTransactionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch(indexPath.row) {
        case 0: return self.categoryTableViewCell
        case 1: return self.amountTableViewCell
        case 2: return self.dateTableViewCell
        case 3: return self.notesTableViewCell
        case 4: return self.recurrTableViewCell
        default: return UITableViewCell()
        }
    }
    
    
}
