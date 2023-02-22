//
//  Resort.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/20.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    
    // static properties
    static let fileName = "resorts.json"
    static let resorts: [Resort] = Bundle.main.decode(fileName)
    static let example = resorts[0]
    
    // caculation property
    var facilityObjects: [Facility] {
        facilities.map(Facility.init)
    }
}

extension Bundle {
    func decode<T: Decodable>(_ fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("Error in url")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error in finding data from url")
        }
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Error in decoding")
        }
        return decoded
    }
}


