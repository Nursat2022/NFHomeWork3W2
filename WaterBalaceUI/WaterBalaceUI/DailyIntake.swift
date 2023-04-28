//
//  DailyIntake.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

struct DailyIntake: View {
    @EnvironmentObject var settingsData: SettingsData
    @State var volume = "\(String(format: "%.0f", AppDataAPI.dailyIntake))"
    var body: some View {
        VStack {
            Headers(text: "Daily intake?")
            TextFieldForVolume(volume: $volume)
            nextOrSaveButton(text: "Save", action: {
                AppDataAPI.dailyIntake = Double(volume) ?? 0
                settingsData.dailyIntake = AppDataAPI.dailyIntake
                AppDataAPI.isOnboarding = true
                withAnimation(.spring()) {
//                    state.state = .main
                }
            })
        }
        .padding(.top, 108)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
}

struct TextFieldForVolume: View {
    @Binding var volume: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 212/255, green: 225/255, blue: 248/255))
                .frame(width: 358, height: 108)
            
            HStack(spacing: 12) {
                TextField("", text: $volume)
                    .keyboardType(.decimalPad)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 19)
                    .frame(width: 250, height: 60)
                    .background(.white)
                    .cornerRadius(16)
                    .multilineTextAlignment(.center)
                
                Text("ML")
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 19)
        }
        Spacer()
    }
}

//struct DailyIntake_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyIntake(state: $state)
//    }
//}
