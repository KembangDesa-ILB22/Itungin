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
    
    private var amountCell: UITableViewCell = UITableViewCell()
    private var notesCell: UITableViewCell = UITableViewCell()
    
    private var amountTextField: UITextField = UITextField()
    private var notesTextField: UITextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        view.addSubview(formTableView)
        formTableView.dataSource = self
        formTableView.delegate = self
        
//        self.amountCell.backgroundColor = .red
        self.amountTextField = UITextField(frame: CGRectInset(self.amountCell.contentView.bounds, 15, 0))
        self.amountCell.textLabel?.text = "Rivaldo"
        self.amountTextField.placeholder = "Amount"
        self.amountCell.addSubview(self.amountTextField)
        
//        self.notesCell.backgroundColor = .blue
        self.notesTextField = UITextField(frame: CGRectInset(self.notesCell.contentView.bounds, 15, 0))
        self.notesTextField.placeholder = "Notes"
        self.notesCell.addSubview(self.notesTextField)
     
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
            case 0: return SelectCategoryTableViewCell()
            case 1: return RecurrenceTableViewCell()
            case 2: return FilledTableViewCell()
            default: return UITableViewCell()
        }
    }
    
    
}
