//
//  Favorites.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/21.
//

import Foundation

class Favorites: ObservableObject {
    
    @Published private var resortIds: Set<String>
    
    let savingKey = "favoriteResortIds"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: savingKey) {
            guard let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) else {
                fatalError("error in decoding")
            }
            resortIds = decoded
        } else {
            resortIds = []
        }
    }
    
    func insert(_ resort: Resort) {
        objectWillChange.send()
        resortIds.insert(resort.id)
        saveData()
    }
    
    func contain(_ resort: Resort) -> Bool {
        resortIds.contains(resort.id)
    }
    
    func remove(resort: Resort) {
        objectWillChange.send()
        resortIds.remove(resort.id)
        print(resortIds)
        saveData()
    }
    
    func saveData() {
        guard let data = try? JSONEncoder().encode(resortIds) else {
            fatalError("error in ecoding")
        }
        UserDefaults.standard.set(data, forKey: savingKey)
    }
}
