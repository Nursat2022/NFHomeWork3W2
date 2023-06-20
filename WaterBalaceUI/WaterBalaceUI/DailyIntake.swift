//
//  DailyIntake.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

struct DailyIntake: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var keyboardHeight: CGFloat = 0
    @EnvironmentObject var settingsData: SettingsData
    @State var toMain = false
    @State var volume = "\(String(format: "%.0f", AppDataAPI.dailyIntake))"
    var body: some View {
        VStack {
            if AppDataAPI.isOnboarding {
                Text("WATER")
                    .font(.system(size: 17))
                    .italic()
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
            }
            Group {
                Headers(text: "Daily intake?")
                TextFieldForVolume(volume: $volume)
                nextOrSaveButton(text: "Save", action: {
                    AppDataAPI.dailyIntake = Double(volume) ?? 0
                    settingsData.dailyIntake = AppDataAPI.dailyIntake
                    if AppDataAPI.isOnboarding {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    else {
                        AppDataAPI.isOnboarding = true
                        toMain = true
                    }
                })
            }
            .offset(y: -keyboardHeight + 30)
            .animation(.easeInOut(duration: 0.3))
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                    if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                        keyboardHeight = keyboardSize.height
                    }
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    keyboardHeight = 0
                }
            }
            
            NavigationLink(isActive: $toMain) {
                Main()
                    .navigationBarBackButtonHidden(true)
            } label: {}
            
        }
        .padding(.top, AppDataAPI.isOnboarding ? 56 : 108)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
                    .keyboardType(.numberPad)
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
