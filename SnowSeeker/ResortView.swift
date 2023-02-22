//
//  ResortView.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/20.
//

import SwiftUI

struct ResortView: View {
    // environment
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    @EnvironmentObject var favorite: Favorites
    
    // for facility item
    @State private var showingAlert = false
    @State private var selectedItem: Facility?
    
    // view parameter
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    VStack {
                        Spacer()
                        HStack {
                            Text("Image credit: \(resort.imageCredit)")
                                .font(.caption)
                                .padding(.leading, 3)
                                .foregroundColor(.black.opacity(0.7))
                            Spacer()
                        }
                    }
                }
                HStack {
                    if horizontalSizeClass == .compact && typeSize > .large{
                        VStack { ResortDetailView(resort: resort) }
                        VStack { SkiDetailView(resort: resort) }
                    }
                    else {
                        ResortDetailView(resort: resort)
                        SkiDetailView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))

                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    HStack {
                        ForEach(resort.facilityObjects) { facility in
                            Button {
                                showingAlert = true
                                selectedItem = facility
                            } label: {
                                facility.icon
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedItem?.name ?? "Imformation", isPresented: $showingAlert, presenting: selectedItem) { _ in
            
        } message: { facility in
            Text(facility.description)
        }
        .toolbar {
            let isFavorite = favorite.contain(resort)
            Button {
                if !isFavorite {
                    favorite.insert(resort)
                }
                else {
                    favorite.remove(resort: resort)
                }
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .secondary)
            }
        }

    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: .example)
            .environmentObject(Favorites())
    }
}
