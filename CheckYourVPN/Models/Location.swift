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
    let zip: String
    let currency: String
    let isp: String
    let org: String
    let proxy: Bool
    let ip: String
    
    var shortDescription: String {
        """
        Country: \(country), \(continent)
        City: \(city), \(regionName)
        IP: \(ip)
        """
    }
    
    var informations: [String] {
        [
            "Continent: \(continent)",
            "Country: \(country)",
            "Region: \(regionName)",
            "City: \(city)",
            "Zip: \(zip)",
            "Currency: \(currency)",
            "Provider: \(isp)",
            "Organization: \(org)",
            "Proxy: \(proxy)",
            "IP: \(ip)"
        ]
    }
}
