//
//  Reminder.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 08.04.2023.
//

import SwiftUI

struct ReminderMe: View {
    
    var body: some View {
        VStack {
//            Image(systemName: "chevron.left")
            
            Headers(text: "Remind me each")
            
            choiceGrid()
            
            nextOrSaveButton(text: "Next")
        }
        .padding(.top, 108)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
}

//struct GoalMain: View {

struct choiceGrid: View {
    @State private var selected: String = ""
    
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
            timeButton(selected: $selected, text: "15 minutes")
            timeButton(selected: $selected, text: "30 minutes")
            timeButton(selected: $selected, text: "45 minutes")
            timeButton(selected: $selected, text: "1 hour")
            timeButton(selected: $selected, text: "1,5 hour")
            timeButton(selected: $selected, text: "2 hour")
            timeButton(selected: $selected, text: "3 hour")
            timeButton(selected: $selected, text: "4 hour")
        }
        .padding(.horizontal, 19)
        .frame(width: 358, height: 330)
        .background(Color(red: 212/255, green: 225/255, blue: 248/255))
        .cornerRadius(16)
        
        Spacer()
    }
}

struct timeButton: View {
    @Binding var selected: String
    var text: String
    var body: some View {
        ZStack {
        
            Button(action: { self.selected = text }) {
                Text(text)
                    .frame(width: 150, height: 60)
            }
//            .padding(.vertical)
//            .padding(.horizontal, 24)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .frame(width: 150, height: 60)
            .background(Color.white)
            .cornerRadius(16)
            
            if selected == text {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 3)
                    .frame(width: 150, height: 60)
            }
        }
    }
}

struct ReminderMe_Previews: PreviewProvider {
    static var previews: some View {
        ReminderMe()
    }
}
