//
//  ProgramItemsTableViewCell.swift
//  SwiftVIPER

import UIKit

class ProgramItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with model: ProgramItemsResponseModelElement) {
        programLabel.text = model.name
        timeLabel.text = model.getTime()
    }
}
