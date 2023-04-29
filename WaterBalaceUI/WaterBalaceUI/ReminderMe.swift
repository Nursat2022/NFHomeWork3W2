//
//  Reminder.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 08.04.2023.
//

import SwiftUI

struct ReminderMe: View {
    @Environment(\.presentationMode) var presentationMode
    @State var TodailyIntake = false
    @EnvironmentObject var settingsData: SettingsData
    var body: some View {
        VStack {
            if AppDataAPI.isOnboarding {
                Text("REMINDER")
                    .font(.system(size: 17))
                    .italic()
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
            }
            Headers(text: "Remind me each")
            
            choiceGrid()
            
            nextOrSaveButton(text: AppDataAPI.isOnboarding ? "Save" : "Next", action: {
                AppDataAPI.remindMe = settingsData.remindMe
                
                if AppDataAPI.isOnboarding {
                    self.presentationMode.wrappedValue.dismiss()
                }
                else {
                    TodailyIntake = true
                }
            })
            
            NavigationLink(isActive: $TodailyIntake) {
                DailyIntake()
                    .environmentObject(settingsData)
            } label: {}

        }
        .padding(.top, AppDataAPI.isOnboarding ? 56 : 108)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
}

struct choiceGrid: View {
    @EnvironmentObject var settingsData: SettingsData
    let minutes = [15, 30, 45, 60, 90, 120, 180, 240]
    
    let columns = [
        GridItem(.fixed(157)),
        GridItem(.fixed(157)),
    ]
    
    let rows = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150)),
        GridItem(.fixed(150)),
        GridItem(.fixed(150)),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 14) {
            ForEach(minutes, id: \.self) {minute in
                timeButton(minute: minute)
            }
        }
        .padding(.horizontal, 19)
        .frame(width: 358, height: 330)
        .background(Color(red: 212/255, green: 225/255, blue: 248/255))
        .cornerRadius(16)
        
        Spacer()
    }
}

struct timeButton: View {
    @EnvironmentObject var settingsData: SettingsData
    var minute: Int
    var body: some View {
        ZStack {
        
            Button(action: { settingsData.remindMe = minute }) {
                Text(minute.toDateString())
                    .frame(width: 150, height: 60)
            }
//            .padding(.vertical)
//            .padding(.horizontal, 24)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .frame(width: 150, height: 60)
            .background(Color.white)
            .cornerRadius(16)
            
            if settingsData.remindMe == minute {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 3)
                    .frame(width: 150, height: 60)
            }
        }
    }
}

// MARK: EXTENSIONS
extension Int {
    func toDateString() -> String {
        let hours = self / 60
        let minutes = self % 60
        if hours >= 1 {
            return minutes == 0 ? "\(hours) hour" : "\(hours),\(String(format: "%.0f", (Double(minutes) / 60) * 10)) hour"
        }
        return "\(self) minutes"
    }
}

//struct ReminderMe_Previews: PreviewProvider {
//    static var previews: some View {
//        ReminderMe()
//    }
//}
