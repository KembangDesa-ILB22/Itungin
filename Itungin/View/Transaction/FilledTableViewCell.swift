//
//  FilledTableViewCell.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 05/03/23.
//

import UIKit

class FilledTableViewCell: UITableViewCell {

    private var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Amount"
        
        return label
    }()
    
    private var fillTextField: UITextField = {
       let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Enter Amount"
        
        return textfield
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(fillTextField)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let fillTextFieldConstraints = [
            fillTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -8),
            fillTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            fillTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(fillTextFieldConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
