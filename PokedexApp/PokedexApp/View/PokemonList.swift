//
//  PokemonList.swift
//  PokedexApp
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import SwiftUI

struct PokemonList: View {
    
    let pokemons: [Pokemon]
    
    var body: some View {
        List {
            ForEach(1..<20) { poke in
                if #available(iOS 15.0, *) {
                    PokemonCell()
                } else {
                    PokemonCell()
                }
            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(pokemons: [])
    }
}
