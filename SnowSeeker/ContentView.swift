//
//  ContentView.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/19.
//

import SwiftUI

struct ContentView: View {
    @State private var resorts: [Resort] = Bundle.main.decode(Resort.fileName)
    @State private var searchString = ""
    @EnvironmentObject var favorite: Favorites
    
    var filterResort: [Resort] {
        // arrange favorite resort front
        let arrangedResort = resorts.sorted { lhs, rhs in
            favorite.contain(lhs)
        }
        // for searchable
        if searchString == "" {
            return arrangedResort
        }
        return arrangedResort.filter { $0.name.localizedCaseInsensitiveContains(searchString) }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterResort) { resort in
                    NavigationLink {
                        ResortView(resort: resort)
                    } label: {
                        HStack {
                            Image(resort.country)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.black, lineWidth: 3)
                                }
                                .padding(10)
                            VStack {
                                Text(resort.name)
                                    .font(.headline)
                                Text("runs: \(resort.runs)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            if favorite.contain(resort) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .accessibilityLabel("Favorite resort")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .frame(height: 60)
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchString)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            
            // Secondary View
            WelcomeView()
        }
        .phoneOnlyStackNavigationView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Favorites())
    }
}
