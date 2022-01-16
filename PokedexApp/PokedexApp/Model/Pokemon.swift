//
//  Pokemon.swift
//  PokedexApp
//
//  Created by Andreas Zwikirsch on 20.12.21.
//

import Foundation


struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String
    let type: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageURL: "1", type: "grass"),
    .init(id: 1, name: "Ivysauer", imageURL: "1", type: "grass"),
    .init(id: 2, name: "Venusaur", imageURL: "1", type: "grass"),
    .init(id: 3, name: "Charmander", imageURL: "1", type: "fire"),
    .init(id: 4, name: "Charmeleon", imageURL: "1", type: "fire"),
    .init(id: 5, name: "Charizard", imageURL: "1", type: "fire"),
    .init(id: 6, name: "Gengar", imageURL: "1", type: "ghost")
]
