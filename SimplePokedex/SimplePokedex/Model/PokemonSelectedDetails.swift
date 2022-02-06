//
//  PokemonSelectedDetails.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 02.02.22.
//

import Foundation
import SwiftUI


struct PokemonSelected : Codable {
    var sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String?
//    var other: PokemonDreamWorld
}

//struct PokemonDreamWorld: Codable {
//    var dream_world: SVGimage
//}
//
//struct SVGimage: Codable {
//    var front_default: String?
//}

struct PokemonDetails: Codable {
    var id: Int
    var weight: Int
    var height: Int
    var name: String
    var types: [PokemonTypes]
}

struct PokemonTypes: Codable {
//    var id = UUID()
    var slot: Int
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
}

