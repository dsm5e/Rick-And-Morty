//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by dsm 5e on 16.08.2023.
//

import Foundation

class RMService {
    
    @MainActor
    func fetchCharacters() async throws -> [Result] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw NSError(domain: "InvalidURL", code: 0)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(APIResponse.self, from: data)
        return response.results
    }
    
    @MainActor
    func getEpisodesByIDs(ids: [String]) async throws -> [EpisodeModel] {
        let urlStrings = ids.map { $0 }
        
        var episodes: [EpisodeModel] = []
        
        for urlString in urlStrings {
            guard let url = URL(string: urlString) else {
                throw NSError(domain: "InvalidURL", code: 0)
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(EpisodeModel.self, from: data)
            episodes.append(response)
        }
        return episodes
    }
}
