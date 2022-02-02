//
//  PokemonSelected.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import Foundation


class PokemonSelectedApi {
    func getPokemonData(url: String, completion: @escaping (PokemonDetails) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonData = try! JSONDecoder().decode(PokemonDetails.self, from: data)
            
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
