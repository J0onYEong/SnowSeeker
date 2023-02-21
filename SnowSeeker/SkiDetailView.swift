//
//  SkiDetailView.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/20.
//

import SwiftUI

struct SkiDetailView: View {
    let resort: Resort

    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
                    .font(.title3)
            }

            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        .frame(maxWidth: .infinity)
    }
}

struct SkiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailView(resort: Resort.example)
    }
}
