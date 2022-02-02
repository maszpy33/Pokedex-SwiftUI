//
//  PokemonSelectedDetails.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 02.02.22.
//

import Foundation


struct PokemonSelected : Codable {
    var sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String?
}

struct PokemonDetails: Codable {
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
