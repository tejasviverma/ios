//
//  CustomButtonView.swift
//  Hike
//
//  Created by Tejasvi Verma on 25/07/25.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                )
                Circle()
                .stroke(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom),lineWidth: 4)
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 24))
                .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
        }
        .frame(width: 58, height: 58)
    }
}

#Preview (traits: .sizeThatFitsLayout) {
    CustomButtonView()
        .padding()
}
