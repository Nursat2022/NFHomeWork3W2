//
//  WhatIsYourGoal.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 08.04.2023.
//

import SwiftUI

struct WhatIsYourGoal: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settingsData: SettingsData
    @State var remindMe = false
    var body: some View {
        NavigationView {
            VStack {
                if AppDataAPI.isOnboarding {
                    Text("THE GOAL")
                        .font(.system(size: 17))
                        .italic()
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
                }
                Headers(text: "What is your goal?")
                
                Buttons()
                
                nextOrSaveButton(text: AppDataAPI.isOnboarding ? "Save" : "Next") {
                    AppDataAPI.goal = settingsData.goal
                    if !AppDataAPI.isOnboarding {
                        remindMe = true
                    }
                    else {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                NavigationLink(isActive: $remindMe) {
                    ReminderMe()
                        .environmentObject(settingsData)
                } label: {}
            }
            .padding(.top, AppDataAPI.isOnboarding ? 56 : 108)
            .padding(.bottom, 50)
            .ignoresSafeArea()
        }
    }
}

struct Buttons: View {
    @EnvironmentObject var settingsData: SettingsData
    var goals = ["One", "Two", "Three", "Four"]
    
    var body: some View {
        VStack {
            VStack(spacing: 14) {
                ForEach(goals, id: \.self) { goal in
                    Button(action: { settingsData.goal = goal }) {
                        HStack {
                            Text("Goal Number \(goal)")
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            ZStack {
                                Circle().stroke(Color.blue, lineWidth: 2).frame(width: 20, height: 20)
                                
                                if settingsData.goal == goal {
                                    Circle().fill(settingsData.goal == goal ? Color.blue :  Color.red).frame(width: 12, height: 12)
                                }
                            }
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 24)
                    .frame(width: 320, height: 60)
                    .background(Color.white)
                    .cornerRadius(16)
                }
            }
        }
        .padding(.horizontal, 19)
        .frame(width: 358, height: 330)
        .background(Color(red: 212/255, green: 225/255, blue: 248/255))
        .cornerRadius(16)
        
        Spacer()
    }
}

struct nextOrSaveButton: View {
    var text: String
    var action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(width: 295, height: 28)
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding(.vertical)
        .padding(.horizontal, 31.5)
        .background(Color.blue)
        .cornerRadius(16)
    }
}

struct Headers: View {
    var text: String
    var body: some View {
        if !AppDataAPI.isOnboarding {
            Text("WATER BALANCE")
                .font(.system(size: 24))
                .italic()
                .fontWeight(.bold)
                .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
        }
        
        Spacer()
        
        
        Text(text)
            .font(.system(size: 36))
            .fontWeight(.bold)
    }
}

struct WhatIsYourGoal_Previews: PreviewProvider {
    static var previews: some View {
        WhatIsYourGoal()
    }
}
