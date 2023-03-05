//
//  SelectDateTableViewCell.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 05/03/23.
//

import UIKit

class SelectDateTableViewCell: UITableViewCell {
    
    
    var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date"
        
        return label
    }()
    
    var buttonDate: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("12 Jan 2023", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(buttonDate)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let buttonDateConstraints = [
            buttonDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            buttonDate.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            buttonDate.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 8)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(buttonDateConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
