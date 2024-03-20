//
//  ApplicationDetailsViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 20/3/24.
//

import UIKit

class ApplicationDetailsViewController: UIViewController {

    @IBOutlet var logoImage: UIImageView!
    
    @IBOutlet var descriptionLabel: UITextView!
    
    var application: Application!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImage.layer.cornerRadius = 15
        logoImage.image = UIImage(named: application.image)
        descriptionLabel.text = application.description
    }

}
