//
//  ResortView.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/20.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
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

                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: .example)
    }
}
