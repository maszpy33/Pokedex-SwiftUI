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
    var selectedPokemon: PokemonEntry
    
    @State private var name: String = "???"
    @State private var weight: Int = 404
    @State private var height: Int = 404
    @State private var types = [PokemonTypes]()
    @State private var mainType: String = "grass"
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    PokemonImage(imageLink: "\(selectedPokemon.url)", imgWidth: CGFloat(220), imgHeight: CGFloat(220))
                        .padding(.bottom, 40)
                        .frame(width: 250, height: 250)
                        .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    Text("Name: \(pokeName)".capitalized)
                        .bold()
                        .font(.title2)
                        .padding(5)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        if types.count == 1 || types.count > 2 {
                            Text("Type:")
                                .bold()
                                .font(.title2)
                            Text("\(types[0].type.name)".capitalized)
                                .bold()
                        } else if types.count == 2 {
                            Text("Types:")
                                .bold()
                                .font(.title2)
                            Text("\(types[0].type.name), \(types[1].type.name)".capitalized)
                                .bold()
                        } else {
                            Text("Types:")
                                .bold()
                                .font(.title2)
                            Text("no type avaliable")
                        }
                    }
                    .padding(10)
                    
                    Text("Weight: \(Double(weight) * 0.453592, specifier: "%.2f") kg")
                        .bold()
                        .font(.title2)
                    Text("Height: \(Double(height) * 2.54, specifier: "%.2f") cm")
                        .bold()
                        .font(.title2)
                    
                }
            }
            .padding(50)
            .background(shadowColor(type: self.mainType).brightness(-0.5))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
//            .shadow(color: shadowColor(type: self.mainType), radius: 12)
        }
        .onAppear {
            PokemonSelectedApi().getPokemonData(url: url) { data in
                self.weight = data.weight
                self.height = data.height
                self.name = data.name
                self.types = data.types
                self.mainType = types[0].type.name
                print("-------------------")
                print(self.types)
                print("\(types[0].type.name)")
                print("Length: \(self.types.count)")
                print("-------------------")
            }
        }
        .navigationBarTitle("\(pokeName)'s Details:".capitalized)
    }
    
    private func stupidUnitToClever(stupidUnit: Int) -> Double {
        return Double(stupidUnit) * 2.54
    }
}
//
//struct PokemonDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailsView()
//    }
//}
