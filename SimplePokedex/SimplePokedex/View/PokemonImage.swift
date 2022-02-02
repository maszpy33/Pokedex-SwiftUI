//
//  PokemonDetail.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    var imgWidth:CGFloat = 75
    var imgHeight:CGFloat = 75
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: imgWidth, height: imgHeight)
        .onAppear {
            let loadedData = UserDefaults.standard.string(forKey: imageLink)
            
            if loadedData == nil {
                getSprite(url: imageLink)
                UserDefaults.standard.set(imageLink, forKey: imageLink)
                //print("New url!!! Caching...")
            } else {
                getSprite(url: loadedData!)
                //print("Using cached url...")
            }
            //print(pokemonSprite)
        }
        .clipShape(Circle())
        .foregroundColor(Color.gray.opacity(0.60))
        .scaledToFit()
        
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        PokemonSelectedApi().getSprite(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
        
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
            .previewInterfaceOrientation(.portrait)
    }
}
