//
//  pokemonViewModel.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import Foundation


class PokemonApi {
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("ERROR 1: Fetching data failed")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknowen error")")
                return
            }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
}
