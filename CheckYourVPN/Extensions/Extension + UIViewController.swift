//
//  Extension + UIViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 19/3/24.
//

import UIKit

extension UIViewController {
    func showAlert(
        withTitle tittle: String,
        andMessage message: String) {
        let alert = UIAlertController(
            title: tittle,
            message: message,
            preferredStyle: .alert
        )
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
