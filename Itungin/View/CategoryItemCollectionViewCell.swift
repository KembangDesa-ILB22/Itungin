//
//  CategoryItemCollectionViewCell.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 26/02/23.
//

import UIKit

class CategoryItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryItemCollectionViewCell"
    
    
    private lazy var itemImageView: UIImageView = {
       let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(systemName: "person")
        
        
        return imageview
    }()
    
    private lazy var imageBgView: UIView = {
       let uiview = UIView()
        uiview.translatesAutoresizingMaskIntoConstraints = false
        uiview.backgroundColor = .gray
        uiview.layer.cornerRadius = ((contentView.frame.size.width/2)-8)
        return uiview
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Insurance"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        
        return label
    }()
    
    func configure(with categoryItemModel: CategoryItem){
        itemLabel.text = categoryItemModel.name
        itemImageView.image = UIImage(systemName: categoryItemModel.icon)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageBgView)
        contentView.addSubview(itemImageView)
        contentView.addSubview(itemLabel)
        
        configureConstraints()
    }
    
    private func configureConstraints(){
        let imageBgViewConstraints = [
            imageBgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageBgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageBgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageBgView.bottomAnchor.constraint(equalTo: itemLabel.topAnchor, constant: -8)
        ]
        
        let paddingImage = contentView.frame.size.width / 6
        let itemImageViewConstraints = [
            itemImageView.leadingAnchor.constraint(equalTo: imageBgView.leadingAnchor, constant: paddingImage),
            itemImageView.trailingAnchor.constraint(equalTo: imageBgView.trailingAnchor, constant: -paddingImage),
            itemImageView.topAnchor.constraint(equalTo: imageBgView.topAnchor, constant: paddingImage),
            itemImageView.bottomAnchor.constraint(equalTo: imageBgView.bottomAnchor, constant: -paddingImage)
        ]
        
        
        let itemLabelConstraints = [
            itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            itemLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(imageBgViewConstraints)
        NSLayoutConstraint.activate(itemImageViewConstraints)
        NSLayoutConstraint.activate(itemLabelConstraints)
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
