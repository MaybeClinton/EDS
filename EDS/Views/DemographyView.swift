//
//  DemographyView.swift
//  EDS
//
//  Created by Not-clinton on 6/20/24.
//

import SwiftUI

struct DemographyView: View {
    @ObservedObject var viewModel: DemographyViewModel
    
    var body: some View {
        VStack {
            Text("Demographic & Personal Details")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("Input your demographic and personal information")
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
                        
            VStack(alignment: .leading, spacing: 10) {
                Text("Demography Details")
                    .font(.headline)
                
                Picker("Select your demographic", selection: $viewModel.selectedDemography) {
                    ForEach(viewModel.demographyOptions, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.menu)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct DemographyView_Previews: PreviewProvider {
    static var previews: some View {
        DemographyView(viewModel: DemographyViewModel())
    }
}

