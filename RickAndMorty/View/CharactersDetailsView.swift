//
//  CharactersDetailsView.swift
//  RickAndMorty
//
//  Created by dsm 5e on 16.08.2023.
//

import SwiftUI

struct CharactersDetailsView: View {
    @ObservedObject var vm: RMViewModel
    let item: Result
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    AsyncImage(url: URL(string: item.image)) { Image in
                        Image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 148, height: 148)
                            .cornerRadius(10)
                    } placeholder: {
                        ZStack {
                            Rectangle()
                                .frame(width: 148, height: 148)
                                .foregroundColor(.gray.opacity(0.1))
                            ProgressView()
                        }
                    }
                    
                    Text(item.name)
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                    
                    Text(item.status.rawValue)
                        .foregroundColor(item.status.color)
                    
                    HStack {
                        Text("Info")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    
                    VStack(spacing: 16) {
                        infoRow(title: "Species:", value: item.species.rawValue)
                        infoRow(title: "Type:", value: item.type.isEmpty ? "None" : item.type)
                        infoRow(title: "Gender:", value: item.gender.rawValue)
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.cellColor)
                    .cornerRadius(16)
                    
                    HStack {
                        Text("Origin")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    
                    VStack(spacing: 16) {
                        originRow(image: item.origin.url, title: item.origin.name, value: item.location.name)
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.cellColor)
                    .cornerRadius(16)
                    
                    HStack {
                        Text("Episodes")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    
                    VStack(spacing: 16) {
                        ForEach(vm.episodes, id: \.id) { episode in
                            episodesRow(title: episode.name, value: episode.episode, date: episode.airDate)
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color.cellColor)
                                .cornerRadius(16)
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .task {
            await vm.fetchEpisodes(item: item.episode)
        }
    }
    
    func infoRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.callout)
                .foregroundStyle(.white.opacity(0.8))
            Spacer()
            Text(value)
        }
    }
    
    func originRow(image: String, title: String, value: String) -> some View {
        HStack(spacing: 16) {
            ZStack {
                Rectangle()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.blackElement)
                    .cornerRadius(10)
                Image("planet")
                    .frame(width: 64, height: 64)
                    .foregroundColor(.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .lineLimit(1)
                Text(value)
                    .lineLimit(1)
                    .font(.callout)
                    .foregroundStyle(.green.opacity(0.8))
            }
            Spacer()
        }
    }
    
    func episodesRow (title: String, value: String, date: String) -> some View {
        
        VStack(spacing: 16) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
            }
            HStack {
                Text(value)
                    .foregroundStyle(.green.opacity(0.8))
                Spacer()
                Text(date)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.8))
            }
        }
    }
}

#Preview {
    CharactersDetailsView(vm: RMViewModel(), item: Result(id: 1, name: "", status: .alive, species: .alien, type: "", gender: .female, origin: Location(name: "Long origin title bag a", url: "asdasdasd"), location: Location(name: "asdasdasddaasdasda", url: ""), image: "", episode: [""], url: "", created: ""))
}
