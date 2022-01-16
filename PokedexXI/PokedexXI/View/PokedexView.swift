//
//  PokedexView.swift
//  PokedexXI
//
//  Created by Andreas Zwikirsch on 15.01.22.
//

import SwiftUI

struct PokedexView: View {
    var pokemonModel = PokemonModel()
    
    @State private var pokemon = [Pokemon]()
    
    var body: some View {
        NavigationView {
            List(pokemon) { poke in
                Text(poke.name)
            }
        }
        .navigationTitle("Pokedex")
        .task {
            pokemon = try! await pokemonModel.getPokemon()
        }
    }
    
//    func loadPokemon() async {
//        do {
//            pokemon = try! await pokemonModel.getPokemon()
//        } catch {
//            print("ERROR while loading data")
//        }
//    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
