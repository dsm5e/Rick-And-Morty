//
//  CharacterViewCell.swift
//  RickAndMorty
//
//  Created by dsm 5e on 16.08.2023.
//

import SwiftUI

struct CharacterViewCell: View {
    var item: Result

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 140)
                    .cornerRadius(10)
                
            } placeholder: {
                ZStack {
                    Rectangle()
                        .frame(width: 140, height: 140)
                        .foregroundColor(.gray.opacity(0.1))
                    ProgressView()
                }
            }
            Text(item.name)
                .font(.system(size: 17).bold())
        }
        .frame(width: 156, height: 202)
        .background(Color.cellColor)
        .cornerRadius(10)
    }
}
