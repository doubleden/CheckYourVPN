//
//  NetworkManager.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 19/3/24.
//

import Foundation
import Alamofire

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
    
    func fetchLocation(from url: URL, completion: @escaping(Result<Location, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let location = Location.getLocation(from: value)
                    completion(.success(location))
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
    }
}
