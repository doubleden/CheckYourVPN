//
//  vpnApplication.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 20/3/24.
//

struct Application {
    let title: String
    let price: String
    let image: String
    let description: String
    
    static func getApplications() -> [Application] {
        let data = DataStore.shared
        var applications: [Application] = []
        
        data.applications.forEach { application in
            applications.append(
                Application(
                    title: application.tittle,
                    price: application.price,
                    image: application.image,
                    description: application.description
                )
            )
        }
        
        return applications
    }
}
