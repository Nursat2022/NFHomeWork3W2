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
            case .main:
                Main(ml: 0)
            }
        }
    }
}
