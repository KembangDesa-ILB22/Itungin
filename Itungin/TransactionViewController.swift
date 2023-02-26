//
//  TransactionViewController.swift
//  Itungin
//
//  Created by Ditha Nurcahya Avianty on 25/02/23.
//

import UIKit

class TransactionViewController: UIViewController {

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
        table.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.id)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "My Transaction"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        setupView()
    }
}

extension TransactionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //search
    }
}

extension TransactionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.id, for: indexPath) as? ItemTableViewCell

        cell?.configure()

        return cell ?? UITableViewCell()
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
