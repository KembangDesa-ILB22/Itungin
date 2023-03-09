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
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
       let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.translatesAutoresizingMaskIntoConstraints = false
                
        return datePicker
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        return blurEffectView
    }()
    
    
    private var category: String = ""
    private var amount: Double = 0
    private var date: Date?
    private var notes: String = ""
    private var recurrence: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(backButton)
        view.addSubview(saveButton)
        view.addSubview(titleLabel)
        view.addSubview(formTableView)
        view.addSubview(blurEffectView)
        view.addSubview(datePicker)
        
        blurEffectView.isHidden = true
        datePicker.isHidden = true
        
        formTableView.dataSource = self
        formTableView.delegate = self
        
        categoryTableViewCell.buttonChev.addTarget(self, action: #selector(showCategorySelection), for: .touchUpInside)
        
        let actionCategory = UITapGestureRecognizer(target: self, action: #selector(showCategorySelection))
        categoryTableViewCell.selectedLabel.addGestureRecognizer(actionCategory)
        categoryTableViewCell.selectedLabel.isUserInteractionEnabled = true
        
        
        amountTableViewCell.fillTextField.addTarget(self, action: #selector(didAmountChange), for: .editingChanged)
        
        notesTableViewCell.fillTextField.addTarget(self, action: #selector(didNotesChange), for: .editingChanged)
        
        recurrTableViewCell.recurrSwitch.addTarget(self, action: #selector(didRecurrenceChange), for: .valueChanged)
        
        dateTableViewCell.buttonDate.addTarget(self, action: #selector(selectDatePicker), for: .touchUpInside)
        
        datePicker.addTarget(self, action: #selector(didDateChanged), for: .valueChanged)
        
        saveButton.addTarget(self, action: #selector(saveTransaction), for: .touchUpInside)
        
        backButton.addTarget(self, action: #selector(cancelTransaction), for: .touchUpInside)
        
        configureConstraints()
    }
    
    @objc private func cancelTransaction() {
        dismiss(animated: true)
    }
    
    @objc private func saveTransaction() {
        let dbManager = DatabaseManager.shared
        
        guard let date = self.date, let recurrence = self.recurrence else { return }
        
        dbManager.saveTransaction(
            amount: self.amount,
            category: self.category,
            recurrence: recurrence,
            notes: self.notes,
            transaction_date: date)
        
        dismiss(animated: true)
    }
    
    @objc private func didDateChanged() {
        print(datePicker.date)
        self.date = datePicker.date
        self.datePicker.isHidden = true
        self.blurEffectView.isHidden = true
    }
    
    @objc private func selectDatePicker(){
        self.datePicker.isHidden = false
        self.blurEffectView.isHidden = false
    }
    
    @objc private func didRecurrenceChange(){
        self.recurrence = recurrTableViewCell.recurrSwitch.isOn
        print(recurrTableViewCell.recurrSwitch.isOn)
    }
    
    @objc private func didNotesChange(){
        self.notes = notesTableViewCell.fillTextField.text ?? ""
        print(notesTableViewCell.fillTextField.text)
    }
    
    @objc private func didAmountChange(){
        self.amount = Double(amountTableViewCell.fillTextField.text ?? "0") ?? 0
        print(amountTableViewCell.fillTextField.text)
    }
    
    @objc private func showCategorySelection(){
//        print("clicked")
        let categoryControllerSheet = CategoryViewController()
        categoryControllerSheet.delegate = self
        
        
        if let presentationController = categoryControllerSheet.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        present(categoryControllerSheet, animated: true)
    }
    
    private func configureConstraints(){
        
        let backButtonConstraints = [
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
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
        
        let datePickerConstrains = [
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let blurEffectViewConstraints = [
            blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(formTableViewConstraints)
        NSLayoutConstraint.activate(backButtonConstraints)
        NSLayoutConstraint.activate(saveButtonConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(datePickerConstrains)
        NSLayoutConstraint.activate(blurEffectViewConstraints)
    }
}

extension AddTransactionViewController: CategorySelectionDelegate {
    func didSelectCategory(with category: CategoryItem) {
        self.category = category.name
        categoryTableViewCell.selectedLabel.text = category.name
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
