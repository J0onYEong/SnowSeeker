//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by 최준영 on 2023/02/20.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        }
        else {
            self
        }
    }
}

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to comne here")
                .font(.largeTitle)
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
