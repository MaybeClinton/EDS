//
//  EDSApp.swift
//  EDS
//
//  Created by Not-clinton on 6/17/24.
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var splashViewModel = SplashViewModel(model: SplashModel())
    @StateObject private var welcomeViewModel = WelcomeViewModel()

    var body: some Scene {
        WindowGroup {
            if splashViewModel.isActive {
                if welcomeViewModel.showMainContent {
                    ContentView()
                } else {
                    WelcomeScreenView(viewModel: welcomeViewModel)
                }
            } else {
                SplashScreenView(viewModel: splashViewModel)
            }
        }
    }
}
