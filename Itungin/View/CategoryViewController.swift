//
//  CategoryViewController.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 25/02/23.
//

import UIKit

class CategoryViewController: UIViewController {
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Category"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .bold))
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        configuration.baseBackgroundColor = .lightGray.withAlphaComponent(0.2)
        configuration.baseForegroundColor = .darkGray
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.configuration = configuration
        
        
        return button
    }()
    
    private let typeSegmentedControl: UISegmentedControl = {
        let typeItem = ["Income", "Expense"]
       let segmentedControl = UISegmentedControl(items: typeItem)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 1
        return segmentedControl
    }()
    
    private let headerLine: UIView = {
       let uiview = UIView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
        uiview.heightAnchor.constraint(equalToConstant: 2).isActive = true
        uiview.backgroundColor = .lightGray.withAlphaComponent(0.5)
        
        return uiview
    }()
    
    private lazy var categoryItemCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: ((view.frame.size.width) / 4) - 10, height: (((view.frame.size.width) / 4) - 10) + 28)
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(CategoryItemCollectionViewCell.self, forCellWithReuseIdentifier: CategoryItemCollectionViewCell.identifier)
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(headerLine)
        view.addSubview(typeSegmentedControl)
        view.addSubview(categoryItemCollectionView)
        
        
        configureConstraints()
        closeButton.addTarget(self, action: #selector(closeSheet), for: .touchUpInside)
        
        categoryItemCollectionView.delegate = self
        categoryItemCollectionView.dataSource = self
    }
    
    @objc private func closeSheet(){
        dismiss(animated: true)
    }
    
    private func configureConstraints() {
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        ]
        
        let closeButtonConstraints = [
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            closeButton.widthAnchor.constraint(equalToConstant: 24)
        ]
        
        let headerLineConstraints = [
            headerLine.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerLine.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16)
        ]
        
        let typeSegmentedControlConstraints = [
            typeSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            typeSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            typeSegmentedControl.topAnchor.constraint(equalTo: headerLine.bottomAnchor, constant: 8)
        ]
        
        let categoryItemCollectionViewConstraints = [
            categoryItemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoryItemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoryItemCollectionView.topAnchor.constraint(equalTo: typeSegmentedControl.bottomAnchor, constant: 8),
            categoryItemCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(closeButtonConstraints)
        NSLayoutConstraint.activate(headerLineConstraints)
        NSLayoutConstraint.activate(typeSegmentedControlConstraints)
        NSLayoutConstraint.activate(categoryItemCollectionViewConstraints)
    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryItemCollectionViewCell.identifier, for: indexPath) as? CategoryItemCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    
}
