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
    @State private var pokemonCount: Int = 151
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 30) {
                        ForEach(searchText == "" ? pokemon : pokemon.filter( {$0.name.contains(searchText.lowercased()) } )) { entryPokemon in
                            NavigationLink(destination: PokemonDetailsView(url: "\(entryPokemon.url)", pokeName: "\(entryPokemon.name)", selectedPokemon: entryPokemon)) {
                                PkmCellView(name: entryPokemon.name, pokemonURL: entryPokemon.url)
                            }
                        }
                    }
                }
            }
//            List {
//                ForEach(searchText == "" ? pokemon : pokemon.filter( {$0.name.contains(searchText.lowercased())} )) { entryPokemon in
//                    HStack {
//                        PokemonImage(imageLink: "\(entryPokemon.url)")
//                            .padding(.trailing, 20)
//
////                        NavigationLink("\(entryPokemon.name)".capitalized ,destination: Text("Detail view for \(entryPokemon.name)"))
//                        NavigationLink(destination: PokemonDetailsView(url: "\(entryPokemon.url)", pokeName: "\(entryPokemon.name)", selectedPokemon: entryPokemon)) {
//                            Text("\(entryPokemon.name)".capitalized)
//                        }
//                    }
//                }
//            }
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
