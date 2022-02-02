//
//  ColorTypeView.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 02.02.22.
//

import SwiftUI

struct ColorTypeView: View {
    let typeColor: String
    
    var body: some View {
        switch typeColor {
        case "grass":
            return Color.green
        case "water":
            return Color.blue
        case "fire":
            return Color.red
        case "bug":
            return: Color(red: 67/255, green: 124/255, red: 23/255)
        default:
            return Color.white
        }
    }
}

struct ColorTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTypeView(typeColor: "grass")
    }
}
