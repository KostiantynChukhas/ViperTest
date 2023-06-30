//
//  ListCollectionViewCell.swift
//  SwiftVIPER


import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: ChannelsResponseModelElement) {
        nameLabel.text = model.callSign
    }

}
