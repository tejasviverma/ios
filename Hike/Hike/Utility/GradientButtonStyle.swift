//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Tejasvi Verma on 28/07/25.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                
                //conditional operator with nil coalescing
                // condition? A:B (A: button pressed, B: not)
                configuration.isPressed ?
                LinearGradient(
                    gradient: Gradient(colors: [.customGrayMedium, .customGrayLight]),
                    startPoint: .top,
                    endPoint: .bottom
                ): LinearGradient(
                    gradient: Gradient(colors: [.customGrayLight, .customGrayMedium]),
                    startPoint: .top,
                    endPoint: .bottom
                ))
        
            .cornerRadius(40)
    }
}
