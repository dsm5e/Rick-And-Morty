//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by dsm 5e on 16.08.2023.
//

import Foundation

class RMViewModel: ObservableObject {
    private let characterService = RMService()
    
    @Published var characters: [Result] = []
    @Published var episodes: [EpisodeModel] = []
    
    @MainActor
    func fetchCharacters() async {
        do {
            characters = try await characterService.fetchCharacters()
        } catch {
            print("Error fetching characters: \(error)")
            characters = []
        }
    }
    
    @MainActor
    func fetchEpisodes(item: [String]) async {
        do {
            let episodeStrings = item.map { $0 }
            episodes = try await characterService.getEpisodesByIDs(ids: episodeStrings)
        } catch {
            print("Error fetching episodes: \(error)")
            episodes = []
        }
    }
}
