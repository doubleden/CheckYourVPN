//
//  Location.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 15/3/24.
//

struct Location: Decodable {
    let status: String
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
    
    var fullDescription: String {
        """
        status: \(status)
        continent: \(continent)
        country: \(country)
        regionName: \(regionName)
        city: \(city)
        zip: \(zip)
        currency: \(currency)
        provider: \(isp)
        organization: \(org)
        proxy: \(proxy)
        IP: \(ip)
        """
    }
}
