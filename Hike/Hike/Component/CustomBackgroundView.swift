//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Tejasvi Verma on 25/07/25.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. Depth
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            // MARK: - 2. Light
            
            Color.customGrayLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            // MARK: - 1. Surface
            LinearGradient(colors: [
                .customGreenLight,
                .customGreenMedium],
                           startPoint: .top,
                           endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
