//
//  DemographyViewModel.swift
//  EDS
//
//  Created by Not-clinton on 6/20/24.
//

import SwiftUI

class DemographyViewModel: ObservableObject {
    @Published var selectedDemography: String = ""
    let demographyOptions = ["Physical Sim", "E Sim",]
}

