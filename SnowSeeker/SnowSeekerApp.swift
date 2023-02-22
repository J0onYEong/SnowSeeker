//
//  SnowSeekerApp.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/19.
//

import SwiftUI

@main
struct SnowSeekerApp: App {
    @StateObject private var favorites = Favorites()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favorites)
        }
    }
}
