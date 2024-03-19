//
//  NetworkManager.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 19/3/24.
//

import Foundation

enum API {
    case location
    
    var url: URL {
        switch self {
        case .location:
            URL(string: "https://api.techniknews.net/ipgeo/")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
    
    var description: String {
        switch self {
        case .noData:
            "Missing Data"
        case .invalidURL:
            "Invalid URL"
        case .decodingError:
            "Decoding Error"
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchLocation(from url: URL, completion: @escaping(Result<Location, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let locationInfo = try JSONDecoder().decode(Location.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(locationInfo))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
            }
        }.resume()
    }
}
