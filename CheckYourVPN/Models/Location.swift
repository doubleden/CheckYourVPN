//
//  Location.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 15/3/24.
//

struct Location: Decodable {
    let continent: String
    let country: String
    let regionName: String
    let city: String
    let ip: String
    
    var description: String {
        """
        Ты находишься в \(country), \(continent)
        А точнее в \(city), \(regionName)
        Твой ip: \(ip)
        """
    }
}
