//
//  PokemonSelected.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import Foundation

struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var weight: Int
    var height: Int
    var name: String
//    var pokemonID: Int
//    var types: [PokemonTypes]
}

struct PokemonSprites: Codable {
    var front_default: String?
}

struct PokemonTypes: Codable, Identifiable {
    var id = UUID()
    var slot: Int
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
}

class PokemonSelectedApi {
    func getPokemonData(url: String, completion: @escaping (PokemonSelected) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonData = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonData)
            }
        }.resume()
    }
    
    
    func getSprite(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
}
