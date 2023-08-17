//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by dsm 5e on 16.08.2023.
//

import SwiftUI

struct CharactersView: View {
    
    @ObservedObject var vm: RMViewModel
    
    let items: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: items, spacing: 20) {
                        ForEach(vm.characters, id: \.id) { item in
                            NavigationLink {
                                CharactersDetailsView(vm: vm, item: item)
                            } label: {
                                CharacterViewCell(item: item)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Characters")
            }
        }
    }
}
