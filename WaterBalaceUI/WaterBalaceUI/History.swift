//
//  History.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

struct History: View {
    var body: some View {
        VStack(spacing: 31) {
            Text("HISTORY")
                .font(.system(size: 17))
                .italic()
                .fontWeight(.black)
                .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
            
            List {
                Section(header: Text("Today")) {
                    volumeAndDate(volume: 250, date: Date().displayMinAndSeconds())
                    volumeAndDate(volume: 300, date: "19:10")
                }
                .listSectionSeparator(.hidden, edges: .top)
                .headerProminence(.increased)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 11, trailing: 16))
                .padding(.top, 20)
                
                Section(header: Text("23.11.12")) {
                    volumeAndDate(volume: 250, date: "12:13")
                    volumeAndDate(volume: 200, date: "14:10")
                    volumeAndDate(volume: 50, date: "15:13")
                    volumeAndDate(volume: 300, date: "19:10")
                }
                .listSectionSeparator(.hidden, edges: .top)
                .headerProminence(.increased)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 11, trailing: 16))
                .padding(.top, 20)
            }
            .listStyle(.plain)
        }
        .padding(.top, 56)
        .padding(.bottom, 50)
        .ignoresSafeArea()    }
}

struct historyForDay: View {
    var body: some View {
        Section(header: Text("Today")) {
            volumeAndDate(volume: 250, date: "12:13")
            volumeAndDate(volume: 200, date: "14:10")
            volumeAndDate(volume: 50, date: "15:13")
            volumeAndDate(volume: 300, date: "19:10")
        }
    }
}

struct volumeAndDate: View {
    var volume: Int
    var date: String
    
    var body: some View {
        HStack {
            Text("\(volume) ml")
            Spacer()
            Text(date)
                .foregroundColor(Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 0.6))
        }
    }
}


struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
