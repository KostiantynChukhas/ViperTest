//
//  DetailTVHeader.swift
//  SwiftVIPER

import UIKit

class DetailTVHeader: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        self.nibSetup()
    }
    
    func setupCell(tvChannel: String) {
        titleLabel.text = tvChannel
    }
}
