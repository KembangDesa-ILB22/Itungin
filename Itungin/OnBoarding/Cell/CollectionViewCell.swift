//
//  CollectionViewCell.swift
//  Itungin
//
//  Created by Hastomi Riduan Munthe on 05/03/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

//    static let identifier = String(describing: CollectionViewCell.self)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
