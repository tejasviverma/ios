//
//  CardView.swift
//  Hike
//
//  Created by Tejasvi Verma on 25/07/25.
//

import SwiftUI

struct CardView: View {
    //MARK: - properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - func
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
            }
    var body: some View {
        
        // MARK: - Card
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - Header
                VStack (alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .customGrayLight, .customGrayMedium
                                ],
                                               startPoint: .top,
                                               endPoint: .bottom))
                        Spacer()
                        Button {
                            // Action: Show a sheet
                            print("the button was presses")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activities for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//:  Header
                .padding(.horizontal, 30)
                //MARK: - Main Component
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 0.5), value: imageNumber)
                }
            //MARK: - Footer
                
                Button{
                    //Action: generate a random number
                    print("Button was pressed")
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenDark], startPoint: .topTrailing, endPoint: .bottomTrailing))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            } //ZStack
        } // CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
