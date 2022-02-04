//
//  PokemonSelected.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 31.01.22.
//

import Foundation
import SwiftUI

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage?
    @Published var cachedImage: UIImage?
    let urlString: String?
    let manager = CacheManager.instance

    init(urlString: String?) {
        self.urlString = urlString
    }
    
    func saveToCach(image: UIImage, urlString: String) {
        manager.add(image: image, name: urlString)
    }
    
    func removeFromCache(urlString: String) {
        manager.remove(name: urlString)
    }
    
    func getFromCache(urlString: String) {
        cachedImage = manager.get(name: urlString)
    }
    
    func getStartingImage() {
        startingImage = UIImage(named: "hare.fill")
    }
}

//class PokemonSelectedApi: ObservableObject {
//
//    @Published var startingImage: UIImage?
//    @Published var cachedImage: UIImage?
//    let urlString: String?
//    let manager = CacheManager.instance
//
//    init(urlString: String?) {
//        self.urlString = urlString
//
//    }
//
//    func getPokemonData(url: String, completion: @escaping (PokemonDetails) -> ()) {
//        guard let url = URL(string: url) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//
//            let pokemonData = try! JSONDecoder().decode(PokemonDetails.self, from: data)
//
//            DispatchQueue.main.async {
//                completion(pokemonData)
//            }
//        }.resume()
//    }
//
//
//    func getSprite(url: String, completion: @escaping (PokemonSprites) -> ()) {
//        guard let url = URL(string: url) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//
//            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
//
//            DispatchQueue.main.async {
//                completion(pokemonSprite.sprites)
//                guard let loadedImage = UIImage(data: pokemonSprite.sprites.front_default) else {
//                    return
//                }
//            }
//        }.resume()
//    }
//}

class PokemonSelectedApi: ObservableObject {
//    @Published var image: UIImage?
//    var urlString: String?
//    var imageCache = ImageCache.getImageCache()
//
//    init(urlString: String?) {
//        self.urlString = urlString
////        loadImage()
//    }
//
//    func loadImageFromCache() -> Bool {
//        guard let urlString = urlString else {
//            return false
//        }
//
//        guard let cacheImage = imageCache.get(forKey: urlString) else {
//            return false
//        }
//
//        image = cacheImage
//        return true
//    }
    
    func getSprite(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)

            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
                print("Stuff")
//                self.urlString = pokemonSprite.sprites.front_default
            }
        }.resume()
    }

    func getPokemonData(url: String, completion: @escaping (PokemonDetails) -> ()) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            let pokemonData = try! JSONDecoder().decode(PokemonDetails.self, from: data)

            DispatchQueue.main.async {
                completion(pokemonData)
            }
        }.resume()
    }
}



class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}

class UrlImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    
    init(urlString: String?) {
        self.urlString = urlString
//        loadImage()
    }
    
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    func loadImageFromURL() {
        
    }
}
