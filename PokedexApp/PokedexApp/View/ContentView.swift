//
//  ContentView.swift
//  PokedexApp
//
//  Created by Andreas Zwikirsch on 17.12.21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            PokemonList(pokemons: pokemonViewModel.pokemons)
                .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
