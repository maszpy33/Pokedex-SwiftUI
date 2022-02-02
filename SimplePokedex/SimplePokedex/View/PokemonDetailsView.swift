//
//  PokemonDetailsView.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 01.02.22.
//

import SwiftUI

struct PokemonDetailsView: View {
    var url = ""
    var pokeName = "Pokemon"
    
    @State private var name: String = "???"
    @State private var weight: Int = 404
    @State private var height: Int = 404
//    @State private var types: [PokemonTypes]()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Name: \(pokeName)".capitalized)
                Text("Weight: \(weight) pounds")
                
            }
        }
        .onAppear {
            PokemonSelectedApi().getPokemonData(url: url) { data in
                self.weight = data.weight
                self.height = data.height
                self.name = data.name
//                self.types = data.types
                
            }
        }
        .navigationBarTitle("\(pokeName) Details:".capitalized)
    }
}
//
//struct PokemonDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailsView()
//    }
//}
