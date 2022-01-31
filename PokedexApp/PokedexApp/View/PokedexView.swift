////
////  PokemonView.swift
////  PokedexApp
////
////  Created by Andreas Zwikirsch on 20.12.21.
////
//
//import SwiftUI
//
//struct PokedexView: View {
//    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
//    
//    @ObservedObject var pokemonViewModel = PokemonViewModel()
//    
//    @State private var numb = 0
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Button("Test Button") {
//                    numb = Int.random(in: 0...1000)
//                    print("____________TEST\(numb)____________")
//                }
//                
//                ScrollView {
//                    LazyVGrid(columns: gridItems, spacing: 16) {
//                        ForEach(pokemonViewModel.pokemon) { pokemon in
//                            PokemonCell(pokemon: pokemon)
//                        }
//                    }
//                }
//            }
//            
//            .navigationTitle("Pokedex")
//        }
//    }
//}
//
//struct PokemonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokedexView()
//    }
//}
