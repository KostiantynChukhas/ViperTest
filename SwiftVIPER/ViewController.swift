//
//  ViewController.swift
//  SwiftVIPER


import UIKit

final class ViewController: UIViewController {

    @IBAction func pushListScreenAction(_ sender: Any) {
        ListRouterInput().push(from: self)
    }

    @IBAction func presentListScreenAction(_ sender: Any) {
        ListRouterInput().present(from: self)
    }

}

extension ViewController: Viewable {}
