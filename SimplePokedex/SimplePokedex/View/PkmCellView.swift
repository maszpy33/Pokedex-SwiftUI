//
//  PkmCellView.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 05.02.22.
//

import SwiftUI


extension Text {
    func oneTypeTextExtension() -> some View {
        self.font(.subheadline).bold()
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.25))
            )
            .frame(width: 100, height: 24)
    }
    
    func twoTypesTextExtension() -> some View {
        self.font(.subheadline).bold()
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.25))
            )
            .frame(width: 100, height: 24)
    }
}


struct PkmCellView: View {
//    let darkPurple = Color(red: 0.4, green: 0.1, blue: 0.6)
    let mainColorGrey = Color(red: 0.1, green: 0.1, blue: 0.1)
    
    var name: String
    var pokemonURL: String
    @State private var pokemonNr: Int = 404
    @State private var types = [PokemonTypes]()
    @State private var mainType: String = "grass"
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("#\(pokemonNr) \(name)".capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 4)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    if types.count == 1 || types.count > 2 {
                        Text("\(types[0].type.name)")
                            .oneTypeTextExtension()
                            .padding(.bottom, 4)
                    } else if types.count == 2 && types[0].type.name == "normal"  && types[1].type.name == "flying" {
                        Text("\(types[1].type.name)".capitalized)
                            .oneTypeTextExtension()
                            .padding(.bottom, 4)
                    } else if types.count == 2 {
                        Text("\(types[0].type.name)".capitalized)
                            .oneTypeTextExtension()
                            .padding(.bottom, 4)
                    } else {
                        Text("no type avaliable")
                    }
                    
                    PokemonImage(imageLink: "\(pokemonURL)", imgWidth: 68, imgHeight: 68)
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 6)
                }
            }
        }
        .onAppear {
            PokemonSelectedApi().getPokemonData(url: pokemonURL) { data in
                self.types = data.types
                self.pokemonNr = data.id
                
                if types.count == 2 && types[0].type.name == "normal" && types[1].type.name == "flying" {
                    self.mainType = types[1].type.name
                } else {
                    self.mainType = types[0].type.name
                }
            }
        }
        .background(getTypeColor(type: self.mainType).brightness(-0.3))
        .cornerRadius(12)
        .shadow(color: getTypeColor(type: self.mainType), radius: 2, x: 0.0, y: 0.0)
    }
}

//struct PkmCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        PkmCellView()
//    }
//}
