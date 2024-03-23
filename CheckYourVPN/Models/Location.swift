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
    let provider: String
    let organization: String
    let proxy: String
    let ip: String
    
    var description: String {
        """
        Country: \(country), \(continent)
        City: \(city), \(regionName)
        IP: \(ip)
        """
    }
    
    var datasOfLocation: [String] {
        [
            "Continent: \(continent)",
            "Country: \(country)",
            "Region: \(regionName)",
            "City: \(city)",
            "Zip: \(zip)",
            "Currency: \(currency)",
            "Provider: \(provider)",
            "Organization: \(organization)",
            "Proxy: \(proxy)",
            "IP: \(ip)"
        ]
    }
    
    init(locationDetails: [String : Any]) {
        continent = locationDetails["continent"] as? String ?? ""
        country = locationDetails["country"] as? String ?? ""
        regionName = locationDetails["regionName"] as? String ?? ""
        city = locationDetails["city"] as? String ?? ""
        zip = locationDetails["zip"] as? String ?? ""
        currency = locationDetails["currency"] as? String ?? ""
        provider = locationDetails["isp"] as? String ?? ""
        organization = locationDetails["org"] as? String ?? ""
        proxy = locationDetails["proxy"] as? String ?? ""
        ip = locationDetails["ip"] as? String ?? ""
    }
    
    static func getLocation(from value: Any) -> Location {
        guard let locationDetails = value as? [String : Any] else {
            return Location(locationDetails: [:])
        }
        
        return Location(locationDetails: locationDetails)
    }
}
