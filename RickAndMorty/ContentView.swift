//
//  ContentView.swift
//  RickAndMorty
//
//  Created by dsm 5e on 16.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = RMViewModel()
    @State var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            if !isLoading {
                SplashScreenView()
            } else {
                CharactersView(vm: vm)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isLoading = true
                }
            }
        }
        .task {
            await vm.fetchCharacters()
        }
    }
}

#Preview {
    ContentView()
}
