//
//  WaterIntake.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

struct WaterIntake: View {
    @State private var volume = "2400"
    var body: some View {
        VStack {
            HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
                        .font(.system(size: 23))
                Spacer()
                    Text("WATER")
                        .font(.system(size: 17))
                        .italic()
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
                Spacer(minLength: 155)
            }
            .padding(.horizontal, 9)
            
            Spacer()
            
            Text("Water intake")
                .font(.system(size: 36))
                .fontWeight(.bold)
            
            TextFieldForVolume(volume: $volume)
            nextOrSaveButton(text: "Add", action: {})
        }
        .padding(.top, 56)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
}

struct WaterIntake_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntake()
    }
}
