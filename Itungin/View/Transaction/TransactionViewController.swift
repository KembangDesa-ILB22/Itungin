//
//  TransactionViewController.swift
//  Itungin
//
//  Created by Ditha Nurcahya Avianty on 25/02/23.
//

import UIKit

protocol ShowSubMenuProtocol {
    func modalWillDismiss()
}

class TransactionViewController: UIViewController {
    
    var transactions: [TransactionEntity] = []
    
    var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = .minimal
        search.placeholder = "Search.."
        search.sizeToFit()
        return search
    }()

    var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = .secondarySystemBackground
        table.separatorColor = .clear
        table.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.id)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "My Transaction"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))
        
        setupView()
        loadData()
        
    }

    @objc func addTapped() {
        let ac = UIAlertController(title: "Input Transaction", message: "Select any of the options below to proceed", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Scan Receipt", style: .default, handler: openScanReceipt))
        ac.addAction(UIAlertAction(title: "Speech", style: .default, handler: openSpeech))
        ac.addAction(UIAlertAction(title: "Manual", style: .default, handler: openManual))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    private func loadData() {
        self.transactions = DatabaseManager.shared.readTransaction()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func openScanReceipt(action: UIAlertAction) {
        navigationController?.pushViewController(DummyViewController(), animated: true)
    }

    func openSpeech(action: UIAlertAction) {
        navigationController?.pushViewController(SpeechViewController(), animated: true)
    }

    func openManual(action: UIAlertAction) {
        let addTransaction = AddTransactionViewController()
        addTransaction.delegate = self
        present(addTransaction, animated: true)
      
    }
}

extension TransactionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //search
    }
}

extension TransactionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.id, for: indexPath) as? ItemTableViewCell

        cell?.configure(with: transactions[indexPath.row])

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DummyViewController(), animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
        
    
}

extension TransactionViewController {
    private func setupView() {
        setupSearch()
        setupTableView()
    }

    private func setupSearch() {
        searchBar.delegate = self
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.setTopAnchorConstraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        searchBar.setLeadingAnchorConstraint(equalTo: view.leadingAnchor, constant: 15)
        searchBar.setTrailingAnchorConstraint(equalTo: view.trailingAnchor, constant: -15)
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.setTopAnchorConstraint(equalTo: searchBar.bottomAnchor, constant: 0)
        tableView.setLeadingAnchorConstraint(equalTo: view.leadingAnchor, constant: 15)
        tableView.setTrailingAnchorConstraint(equalTo: view.trailingAnchor, constant: -15)
        tableView.setBottomAnchorConstraint(equalTo: view.bottomAnchor)
    }
}

extension TransactionViewController: ShowSubMenuProtocol {
    func modalWillDismiss() {
        loadData()
    }
}
