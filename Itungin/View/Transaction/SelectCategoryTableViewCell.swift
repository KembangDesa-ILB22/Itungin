//
//  SelectCategoryViewCell.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 05/03/23.
//

import UIKit

class SelectCategoryTableViewCell: UITableViewCell {
    
    private var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category"
        
        return label
    }()
    
    private var selectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Category"
        
        
        return label
    }()
    
    private var buttonChev: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(buttonChev)
        contentView.addSubview(selectedLabel)
        
        configureConstraints()
    }
    
    private func configureConstraints(){
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let buttonChevConstraints = [
            buttonChev.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            buttonChev.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonChev.widthAnchor.constraint(equalToConstant: 20)
        ]
        
        let selectedLabelConstraints = [
            selectedLabel.trailingAnchor.constraint(equalTo: buttonChev.leadingAnchor, constant: -8),
            selectedLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            selectedLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(buttonChevConstraints)
        NSLayoutConstraint.activate(selectedLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
