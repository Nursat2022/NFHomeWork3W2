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
    @Published var remindMe: Int = AppDataAPI.remindMe
    @Published var IntakeForToday: Double = AppDataAPI.IntakeForToday
}

struct Settings: View {
    @EnvironmentObject var settingsData: SettingsData
    var body: some View {
        VStack(spacing: 31) {
            Text("EDIT")
                .italic()
                .fontWeight(.black)
                .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
            
            List {
                NavigationLink {
                    DailyIntake()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Daily Intake Level")
                        Spacer()
                        Group {
                            Text("\(String(format: "%.0f", settingsData.dailyIntake)) ML")
                        }
                        .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 0.6))
                    }
                }
                .listSectionSeparator(.hidden, edges: .top)
                
                NavigationLink {
                    WhatIsYourGoal()
                } label: {
                    HStack {
                        Text("Your goal")
                        Spacer()
                            .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 0.6))
                    }
                }
                
                HStack {
                    Text("Reminder")
                    Spacer()
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
