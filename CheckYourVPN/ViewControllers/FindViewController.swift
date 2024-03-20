//
//  FindViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 15/3/24.
//

import UIKit

final class FindViewController: UIViewController {

    @IBOutlet var processLabel: UILabel!
    @IBOutlet var progressImage: UIImageView!
    @IBOutlet var ipInfoLabel: UILabel!
    @IBOutlet var moreInfoButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let networkManager = NetworkManager.shared
    private var location: Location? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionVC = segue.destination as? DescriptionTableViewController
        descriptionVC?.location = location
    }
    
    @IBAction func updateButtonDidTapped() {
        processLabel.text = "Searching..."
        progressImage.image = UIImage(named: "searching")
        ipInfoLabel.text = ""
        moreInfoButton.isHidden = true
        activityIndicator.startAnimating()
        fetchLocation()
    }
}

// MARK: - Private Methods
private extension FindViewController {
    func fetchLocation() {
        networkManager.fetchLocation(from: API.location.url) { [unowned self] result in
            switch result {
            case .success(let location):
                self.location = location
                ipInfoLabel.text = location.shortDescription
                progressImage.image = UIImage(named: "planetFindYou")
                processLabel.text = "Location was found"
                moreInfoButton.isHidden = false
                activityIndicator.stopAnimating()
            case .failure(let error):
                processLabel.text = "Location was not found"
                processLabel.textColor = .red
                progressImage.image = UIImage(named: "error")
                showAlert(withTitle: "Error", andMessage: error.description)
                activityIndicator.stopAnimating()
            }
        }
    }
}
