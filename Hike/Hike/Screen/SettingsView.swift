//
//  SettingsView.swift
//  Hike
//
//  Created by Tejasvi Verma on 28/07/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List{
            //MARK: - Header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack (spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(
                    colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom
                ))
                .padding(.top,8)
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is even better onv=ce you are actually there. The hike that you hope to do again someday. \nFind the best hike days in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                    .frame(maxWidth: .infinity)
            } //: header
            .listRowSeparator(.hidden)
            //MARK: - Icons
            //MARK: - About
        } //: LIST
    }
}

#Preview {
    SettingsView()
}
