//
//  Settings.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

class SettingsData: ObservableObject {
    @Published var dailyIntake = AppDataAPI.dailyIntake
    @Published var goal: String = AppDataAPI.goal
    @Published var remindMe: String = AppDataAPI.remindMe
}

struct Settings: View {
    var body: some View {
        VStack(spacing: 31) {
            Text("EDIT")
                .italic()
                .fontWeight(.black)
                .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
            
            List {
                HStack {
                    Text("Daily Intake Level")
                    Spacer()
                    Group {
                        Text("2400 ML")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 0.6))
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 11, trailing: 16))
                .padding(.top, 20)
                
                HStack {
                    Text("Your goal")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 0.6))
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 11, trailing: 16))
                .padding(.top, 20)
                
                HStack {
                    Text("Reminder")
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 0.6))
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 11, trailing: 16))
                .padding(.top, 20)
            }
            .listStyle(.plain)
        }
        .padding(.top, 56)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
