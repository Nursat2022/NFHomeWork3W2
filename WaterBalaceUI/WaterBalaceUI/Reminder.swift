//
//  Reminder.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 09.04.2023.
//

import SwiftUI

struct Reminder: View {
    var body: some View {
        VStack {
            HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
                        .font(.system(size: 23))
                Spacer()
                    Text("REMINDER")
                        .font(.system(size: 17))
                        .italic()
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 5/255, green: 165/255, blue: 239/255))
                Spacer(minLength: 140)
            }
            .padding(.horizontal, 9)

            
            Spacer()
            
            Text("Remind me each")
                .font(.system(size: 36))
                .fontWeight(.bold)
            
          choiceGrid()
            
            nextOrSaveButton(text: "Save", action: {})
        }
        .padding(.top, 56)
        .padding(.bottom, 50)
        .ignoresSafeArea()
    }
}

struct Reminder_Previews: PreviewProvider {
    static var previews: some View {
        Reminder()
    }
}
