//
//  DailyIntake.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

struct WaterIntake: View {
    var date = Date()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settingsData: SettingsData
    @State var history: historyForDay = historyForDay()
    @State var volume = "0"
    var body: some View {
        VStack {
            Headers(text: "Water Intake")
            TextFieldForVolume(volume: $volume)
            nextOrSaveButton(text: "Add", action: {
                AppDataAPI.IntakeForToday += Double(volume) ?? 0
                settingsData.IntakeForToday = AppDataAPI.IntakeForToday
                history = getHistoryForDay(day: date.getDay())
                history.time.append(date.displayMinAndSeconds())
                history.waterIntake.append(Double(volume) ?? 0)
                setHistoryToUserDefaults(history: history, day: date.getDay())
                self.presentationMode.wrappedValue.dismiss()
            })
        }
//        .navigationBarBackButtonHidden(true)
        .padding(.top, 108)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
}


struct WaterIntake_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntake()
    }
}
