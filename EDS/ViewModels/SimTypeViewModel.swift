//
//  SimTypeViewModel.swift
//  EDS
//
//  Created by Not-clinton on 6/21/24.
//

import SwiftUI

class SimTypeViewModel: ObservableObject {
    @Published var showPopup = false
    @Published var selectedOption: String? = nil
}
