//
//  AnimationExtension.swift
//  SimplePokedex
//
//  Created by Andreas Zwikirsch on 06.02.22.
//

import Foundation
import SwiftUI


struct Rotation3DAnimationStyle: ButtonStyle {
//    var animationAmount: CGFloat = 1
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
//            .rotation3DEffect(.degrees(configuration.isPressed ? 360 : 0.0), axis: (x: 0, y: 1, z: 1))
//            .scaleEffect(animationAmount)
//            .blur(radius: (animationAmount - 1) * 3)
//            .animation(Animation.easeIn(duration: 1.0), value: configuration.isPressed ? 2 : 0)
            .scaleEffect(configuration.isPressed ? 5.0 : 1.0)
            .animation(.easeIn(duration: 0.4), value: configuration.isPressed)
    }
}
