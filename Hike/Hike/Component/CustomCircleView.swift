//
//  CustomCircleView.swift
//  Hike
//
//  Created by Tejasvi Verma on 28/07/25.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.customIndigoMedium, .customSalmonLight], startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimateGradient ? .bottomTrailing : .bottomTrailing)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        } //: ZStack
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
