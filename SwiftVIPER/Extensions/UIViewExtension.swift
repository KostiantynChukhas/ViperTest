//
//  UIViewExtension.swift
//  SwiftVIPER


import Foundation
import UIKit

extension UIView {
    func nibSetup() {
        // self.backgroundColor = .clear
        let subView = loadViewFromNib()
        subView.frame = bounds
        // subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // subView.translatesAutoresizingMaskIntoConstraints = true
        subView.backgroundColor = .clear
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(subView)
        self.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: subView.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true
        // subView.backgroundColor = .green
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = (nib.instantiate(withOwner: self, options: nil).first as? UIView) ?? UIView()
        return nibView
    }
}

