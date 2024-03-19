//
//  FindViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 15/3/24.
//

import UIKit

final class FindViewController: UIViewController {

    @IBOutlet var processLabel: UILabel!
    @IBOutlet var ipInfoLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var moreInfoButton: UIButton!
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLocation()
    }
    @IBAction func updateButtonDidTapped() {
        processLabel.text = "Searching..."
        ipInfoLabel.text = ""
        moreInfoButton.isHidden = true
        activityIndicator.startAnimating()
        fetchLocation()
    }
    
    private func fetchLocation() {
        networkManager.fetchLocation(from: API.location.url) { [unowned self] result in
            switch result {
            case .success(let location):
                ipInfoLabel.text = location.description
                activityIndicator.stopAnimating()
                processLabel.text = "Location was found"
                moreInfoButton.isHidden = false
            case .failure(let error):
                showAlert(withTitle: "Error", andMessage: error.description)
                processLabel.textColor = .red
                processLabel.text = "Location was not found"
            }
        }
    }
}
