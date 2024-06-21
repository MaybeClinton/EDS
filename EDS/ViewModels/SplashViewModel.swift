//
//  SplashViewModel.swift
//  EDS
//
//  Created by Not-clinton on 6/17/24.
//

import Foundation
import Combine

class SplashViewModel: ObservableObject {
    @Published var welcomeMessage: String
    @Published var isActive: Bool = false

    private var model: SplashModel
    private var cancellables = Set<AnyCancellable>()

    init(model: SplashModel) {
        self.model = model
        self.welcomeMessage = model.welcomeMessage
        self.startTimer()
    }

    func startTimer() {
        Timer.publish(every: 2.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.isActive = true
            }
            .store(in: &cancellables)
    }
}

