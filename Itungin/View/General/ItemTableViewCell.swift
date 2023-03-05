//
//  ItemTableViewCell.swift
//  Itungin
//
//  Created by Ditha Nurcahya Avianty on 25/02/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static let id = "ItemTableViewCell"

    lazy var categoryImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        return image
    }()

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .red
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        setupView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }

    func configure(){
        categoryImage.image = UIImage(systemName: "bag.fill")
        categoryLabel.text = "Beauty"
        itemLabel.text = "Sunscreen"
        dateLabel.text = Date().dateToString()
        totalLabel.text = "- IDR 170.000"
    }
}

extension ItemTableViewCell {
    func setupView() {
        setupCategory()
        setupItemName()
        setupDateAndTotal()
    }

    func setupCategory() {
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        categoryImage.widthAnchor.constraint(equalTo: categoryImage.heightAnchor).isActive = true

        let stackView = UIStackView(arrangedSubviews: [categoryImage, categoryLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.setTopAnchorConstraint(equalTo: topAnchor, constant: 10)
        stackView.setLeadingAnchorConstraint(equalTo: leadingAnchor, constant: 20)
        stackView.setTrailingAnchorConstraint(equalTo: trailingAnchor, constant: -20)
    }

    func setupItemName() {
        addSubview(itemLabel)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.setTopAnchorConstraint(equalTo: categoryLabel.bottomAnchor, constant: 5)
        itemLabel.setLeadingAnchorConstraint(equalTo: leadingAnchor, constant: 20)
        itemLabel.setTrailingAnchorConstraint(equalTo: trailingAnchor, constant: -20)
    }

    func setupDateAndTotal() {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, totalLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.setTopAnchorConstraint(equalTo: itemLabel.bottomAnchor, constant: 5)
        stackView.setLeadingAnchorConstraint(equalTo: leadingAnchor, constant: 20)
        stackView.setTrailingAnchorConstraint(equalTo: trailingAnchor, constant: -20)
    }
}
