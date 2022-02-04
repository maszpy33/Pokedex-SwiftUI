//
//  CachePkmImg.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 03.02.22.
//

import Foundation
import SwiftUI

class CacheManager {
    
    static let instance = CacheManager() // Singleton
    private init() { }
    
    // NS stands for NextStep
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 50
        cache.totalCostLimit = 1024 * 1014 * 100 // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("--------------------")
        print("Added to cache!")
        print("--------------------")
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("--------------------")
        print("Removed from cache!")
        print("--------------------")
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
}

//class ImageCache {
//    var cache = NSCache<NSString, UIImage>()
//    
//    func get(forKey: String) -> UIImage? {
//        return cache.object(forKey: NSString(string: forKey))
//    }
//    
//    func set(forKey: String, image: UIImage) {
//        cache.setObject(image, forKey: NSString(string: forKey))
//    }
//}
//
//extension ImageCache {
//    private static var imageCache = ImageCache()
//    static func getImageCache() -> ImageCache {
//        return imageCache
//    }
//}
//
//class UrlImageModel: ObservableObject {
//    var imageCache = ImageCache.getImageCache()
//}
