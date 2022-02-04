//
//  ColorTypeView.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 02.02.22.
//

import SwiftUI
import Foundation

extension UIColor {

    var darker: UIColor {

    var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0

        guard self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) else {
            print("** some problem demuxing the color")
            return .gray
        }

        let nudged = b * 0.5

        return UIColor(hue: h, saturation: s, brightness: nudged, alpha: a)
    }
}

func shadowColor(type: String?) -> Color {
    if type == nil {
        return Color.white
    } else {
        switch type {
        case "grass":
            return Color.green
        case "water":
            return Color.blue
        case "fire":
            return Color.red
        case "bug":
            return Color(red: 0.6, green: 0.87, blue: 0.92)
        case "ghost":
            return Color.purple
        case "dark":
            return Color(red: 0.05, green: 0.05, blue: 0.05)
        case "dragon":
            return Color.orange
        case "ice":
            return Color(red: 30/255, green: 240/255, blue: 1)
        case "electric":
            return Color.yellow
        case "flying":
            return Color(red: 0.4627, green: 0.8392, blue: 1.0)
        case "steel":
            return Color(white: 0.4745)
        case "ground":
            return Color.brown
        case "rock":
            return Color(red: 0.5, green: 0.5, blue: 0.5)
        case "poison":
            return Color(red: 1, green: 84/255, blue: 31/255)
        case "fight":
            return Color(red: 1, green: 100/255, blue: 40/255)
        case "psychic":
            return Color.pink
        default:
            return Color.white
        }
    }
}
