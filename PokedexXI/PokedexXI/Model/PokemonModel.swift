//
//  PokemonModel.swift
//  PokedexXI
//
//  Created by Andreas Zwikirsch on 15.01.22.
//

import Foundation


struct Pokemon: Identifiable, Decodable {
    let pokemonID = UUID()
    
    let id: Int
    let name: String
    let imageURL: String
    let type: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "imageURL"
        case type
        case description
    }
}

enum FetchError: Error {
    case badURL
    case badResponse
    case badData
}

class PokemonModel: ObservableObject {
    @Published var allPokemon = [Pokemon]()
    
    init(pokemon: [Pokemon]) {
        self.allPokemon = pokemon
    }
    
    init() {
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) { data, response, sessionError in
            guard let data = data else {
                print("Fetch failed: \(sessionError?.localizedDescription ?? "Unknowen error")")
                return
            }
            
            guard let data = data.removeNullsFrom(string: "null,") else {
                print("Removing null failed")
                return
            }
            
            do {
                var decoded = try JSONDecoder().decode([Pokemon].self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    self?.allPokemon = decoded
                }
            } catch let decodingError {
                print("Decoding failed: \(decodingError.localizedDescription)")
            }
            
            DispatchQueue.global().async {
                session.resume()
            }
        }

    }
}

//class PokemonModelx {
//    func getPokemon() async throws -> [Pokemon] {
//        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else {
//            throw FetchError.badURL
//        }
//
//        let urlRequest = URLRequest(url: url)
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badResponse }
//        guard let data = data.removeNullsFrom(string: "null,") else { throw FetchError.badData }
//
//        let pokemonData = try JSONDecoder().decode([Pokemon].self, from: data)
//
//        return pokemonData
//    }
//}

extension Data {
    func removeNullsFrom(string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
