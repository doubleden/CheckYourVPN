//
//  FindViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 15/3/24.
//

import UIKit

final class FindViewController: UIViewController {

    @IBOutlet var ipInfoLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchLocation()
    }
    
    private func fetchLocation() {
        let api = URL(string: "https://api.techniknews.net/ipgeo/")!
        
        URLSession.shared.dataTask(with: api) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let locationInfo = try JSONDecoder().decode(Location.self, from: data)
                print(locationInfo)
            } catch {
                print(error)
            }
        }.resume()
    }

}
