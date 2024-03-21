//
//  DescriptionTableViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 20/3/24.
//

import UIKit

final class DescriptionTableViewController: UITableViewController {
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        location.datasOfLocation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath)
    
        var content = cell.defaultContentConfiguration()
        let dataOfLocation = location.datasOfLocation[indexPath.row]
        
        content.text = dataOfLocation
        content.textProperties.color = UIColor.descrpFont
        cell.contentConfiguration = content
        return cell
    }
}
