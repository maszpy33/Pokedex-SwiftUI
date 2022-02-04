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

    @State var cachedImage = UIImage(named: "hase.fill")
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pokemonSprite)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: imgWidth, height: imgHeight)
        }
        .onAppear {
            let loadedData = UserDefaults.standard.string(forKey: imageLink)
//            print("Loaded Data: \(String(describing: loadedData ?? "no data avaliable"))")
            
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
    
    static var defaultImage = UIImage(named: "hase.fill")
    
    func getSprite(url: String) {
        var tempSprite: String?
        PokemonSelectedApi().getSprite(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "hase.sprit"
        }
        
    }
}

//struct PokemonDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonImage()
//            .previewInterfaceOrientation(.portrait)
//    }
//}
