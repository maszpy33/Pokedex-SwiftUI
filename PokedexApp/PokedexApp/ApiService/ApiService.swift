//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Andreas Zwikirsch on 20.12.21.
//

import SwiftUI

class ApiService: ObservableObject {
//    @Published var pokemon = [Pokemon]()
    
//    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    // complete URL: https://raw.githubusercontent.com/robert-z/simple-pokemon-json-api/master/data/pokemon.json
    let baseURL = "https://raw.githubusercontent.com/robert-z/simple-pokemon-json-api"
    
//
    
    func fetchPokemon(completion: @escaping ([Pokemon]) -> ()) {
        let specificURL: String = "\(baseURL)/master/data/pokemon.jason"
        
        guard let url = URL(string: specificURL) else {
            print("ERROR 1: url not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("ERROR 2: data failed")
                return
            }
            
            guard let pokemons = try? JSONDecoder().decode([Pokemon].self, from: data) else {
                print("ERROR 3: decoding failed")
                return
            }
            
            DispatchQueue.main.async {
                print("_____________________________________________")
                print(pokemons)
                print("_____________________________________________")
                completion(pokemons)
            }
        }.resume()
    }
    
//    func fetchPokemon() {
//        let specificURL: String = "\(baseURL)/master/data/pokemon.jason"
//
//        guard let url = URL(string: baseURL) else {
//            print("ERROR 1: url not found")
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data?.parseData(removeString: "null,") else {
//                print("ERROR 2: removing null failed")
//                return
//
//            }
//
//            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {
//                print("ERROR 3: decoding failed")
//                return
//            }
//
//            print("_________________")
//            print(pokemon)
//            print("_________________")
//
//            DispatchQueue.main.async {
//                self.pokemon = pokemon
//            }
//        }.resume()
//    }
    
    //    init(pokemon: [Pokemon]) {
    //        self.allPokemon = pokemon
    //    }
    //
    //    init() {
    //        guard let url = URL(string: baseURL) else {
    //            print("Invalid URL")
    //            return
    //        }
    //
    //        let request = URLRequest(url: url)
    //
    //        let session = URLSession.shared.dataTask(with: request) { data, response, sessionError in
    //            guard let data = data?.parseData(removeString: "null,") else {
    //                print("Fetch failed: \(sessionError?.localizedDescription ?? "Unknowen error")")
    //                return
    //            }
    //
    //            print(data)
    //
    //            do {
    //                var decoded = try JSONDecoder().decode([Pokemon].self, from: data)
    //
    //                DispatchQueue.main.async { [weak self] in
    //                    self?.allPokemon = decoded
    //                }
    //            } catch let decodingError {
    //                print("Decoding failed: \(decodingError.localizedDescription)")
    //            }
    //        }
    //
    //        DispatchQueue.global().async {
    //            session.resume()
    //        }
    //    }
    
    
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
