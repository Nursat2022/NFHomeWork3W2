//
//  History.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var days = UserDefaults.standard.object(forKey: "historyDays") as? [String] ?? []
    @Published var history: historyForDay = historyForDay()
    
    func updateHistory() {
        for day in days {
            let historyOfDay = getHistoryForDay(day: day)
            history = historyOfDay
        }
    }
}

struct History: View {
    @ObservedObject var viewModel = HistoryViewModel()
    var historyDays = UserDefaults.standard.object(forKey: "historyDays") as? [String] ?? []
    var body: some View {
        VStack(spacing: 31) {
            Text("HISTORY")
                .font(.system(size: 17))
                .italic()
                .fontWeight(.black)
                .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
            
            List {
                ForEach(viewModel.days, id: \.self) {day in
                    Section(header: Text(day == viewModel.days.last ? "Today" : day)) {
                        volumesAndTime(day: day)
                    }
                    .listSectionSeparator(.hidden, edges: .top)
                    .headerProminence(.increased)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 11, trailing: 16))
                    .padding(.top, 20)   
                }
            }
            .listStyle(.plain)
        }
        .padding(.top, 56)
        .padding(.bottom, 50)
        .ignoresSafeArea()
        
    }
}

struct volumesAndTime: View {
    var day: String
    var history: historyForDay
    
    init(day: String) {
        self.day = day
        history = getHistoryForDay(day: day)
    }
    var body: some View {
        ForEach(history.time.indices, id: \.self) {index in
            volumeAndDate(volume: history.waterIntake[index], date: history.time[index])
        }
    }
}

struct volumeAndDate: View {
    var volume: Double
    var date: String
    
    var body: some View {
        HStack {
            Text("\(String(format: "%.0f", volume)) ml")
            Spacer()
            Text(date)
                .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 0.6))
        }
    }
}

class historyForDay: Codable {
    var time: [String] = []
    var waterIntake: [Double] = []
}


// MARK: SET HISTORY TO USER DEFAULTS
func setHistoryToUserDefaults(history: historyForDay, day: String) {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(history)
        UserDefaults.standard.set(data, forKey: day)
    } catch {
        print("Unable to Encode Array of Notes (\(error))")
    }
}

//MARK: GET HISTORY FROM USER DEFAULTS

func getHistoryForDay(day: String) -> historyForDay {
    let defaultValue = historyForDay()
    guard let data = try? UserDefaults.standard.object(forKey: day) as? Data else {
        return defaultValue
    }
    let value = try? JSONDecoder().decode(historyForDay.self, from: data)
    return value ?? defaultValue
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
