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
        configuration.image = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10))
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(headerLine)
        view.addSubview(typeSegmentedControl)
        
        
        configureConstraints()
        closeButton.addTarget(self, action: #selector(closeSheet), for: .touchUpInside)
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
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(closeButtonConstraints)
        NSLayoutConstraint.activate(headerLineConstraints)
        NSLayoutConstraint.activate(typeSegmentedControlConstraints)
    }
}
