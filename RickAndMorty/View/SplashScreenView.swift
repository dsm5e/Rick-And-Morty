//
//  SplashScreenView.swift
//  RickAndMorty
//
//  Created by dsm 5e on 16.08.2023.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            Image("star")
            
            VStack(spacing: 36) {
                Image("logo")
                Image("portal")
            }
            .padding(.bottom, 210)
        }
    }
}

#Preview {
    SplashScreenView()
}
