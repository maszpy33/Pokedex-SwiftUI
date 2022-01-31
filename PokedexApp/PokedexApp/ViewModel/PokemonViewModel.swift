//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import Foundation


class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    init() {
        self.fetchPokemons()
    }
    
    func fetchPokemons() {
        ApiService().fetchPokemon { pokemons in
            self.pokemons = pokemons
        }
    }
    
}
