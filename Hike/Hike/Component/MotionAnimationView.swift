//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Tejasvi Verma on 28/07/25.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    //MARK: - circle
    //s1: random coord
    func randomCoord() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    //s2. random size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    //s3. random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //s4. random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.3...1.0)
    }
    //s5.randpom delay
    func randomDelya() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoord(),
                        y: randomCoord()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelya())) {
                                isAnimating = true
                            }
                    })
            }
        } //: Zstack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup() //offers great performance
    }
}

#Preview {
    ZStack{
        MotionAnimationView()
            .background(
                Circle()
                    .fill(.teal)
            )
    }
   
}
