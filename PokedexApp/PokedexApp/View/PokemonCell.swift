//
//  PokemonCell.swift
//  PokedexApp
//
//  Created by Andreas Zwikirsch on 17.12.21.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    let darkPurple = Color(red: 0.4, green: 0.1, blue: 0.6)
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    Image("Gengar_Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(darkPurple)
        .cornerRadius(12)
        .shadow(color: .purple, radius: 6, x: 0.0, y: 0.0)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON[6]).preferredColorScheme(.dark)
    }
}
