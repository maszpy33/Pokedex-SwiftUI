//
//  PokedexView.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import SwiftUI

struct PokedexView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter( {$0.name.contains(searchText.lowercased())} )) { entryPokemon in
                    HStack {
                        PokemonImage(imageLink: "\(entryPokemon.url)")
                            .padding(.trailing, 20)
                        
//                        NavigationLink("\(entryPokemon.name)".capitalized ,destination: Text("Detail view for \(entryPokemon.name)"))
                        NavigationLink(destination: PokemonDetailsView(url: "\(entryPokemon.url)", pokeName: "\(entryPokemon.name)", selectedPokemon: entryPokemon)) {
                            Text("\(entryPokemon.name)".capitalized)
                        }
                    }
                }
            }
            .onAppear {
                PokemonApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("PokedexUI")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
