//
//  WaterBalaceUIApp.swift
//  WaterBalaceUI
//
//  Created by Nursat Sakyshev on 08.04.2023.
//

import SwiftUI

enum AppScreenState {
    case onboarding
    case main
}

@main
struct WaterBalaceUIApp: App {
    @StateObject var settingsData: SettingsData = SettingsData()
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    @State var state: AppScreenState
    var isOnboardingSeen: Bool
    
    init() {
        self.isOnboardingSeen = AppDataAPI.isOnboarding
            switch isOnboardingSeen {
            case true:
                self.state = .main
            case false:
                self.state = .onboarding
            }
    }
    
    var body: some Scene {
        WindowGroup {
            switch state {
            case .onboarding:
                WhatIsYourGoal()
                    .environmentObject(settingsData)
            case .main:
                withAnimation(.spring()) {
                    Main(ml: 0)
                        .transition(transition)
                        .environmentObject(settingsData)
                }
            }
        }
    }
}
