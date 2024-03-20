//
//  DescriptionViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 20/3/24.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = location.fullDescription
    }

}
