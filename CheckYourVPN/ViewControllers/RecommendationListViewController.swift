//
//  RecommendationListViewController.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 20/3/24.
//

import UIKit

final class RecommendationListViewController: UITableViewController {
    
    private let applications = Application.getApplications()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let applicationIndex = tableView.indexPathForSelectedRow {
            let applicationDetailsVC = segue.destination as? ApplicationDetailsViewController
            applicationDetailsVC?.application = applications[applicationIndex.row]
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        applications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellVPN", for: indexPath)
        let application = applications[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = application.title
        content.secondaryText = application.price
        content.image = UIImage(named: application.image)
        content.imageProperties.cornerRadius = 10
        
        cell.contentConfiguration = content
        return cell
    }
}
