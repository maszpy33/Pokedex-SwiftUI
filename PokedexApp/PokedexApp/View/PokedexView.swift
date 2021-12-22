//
//  PokemonView.swift
//  PokedexApp
//
//  Created by Andreas Zwikirsch on 20.12.21.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.allPokemon) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
