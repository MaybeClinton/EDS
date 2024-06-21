//
//  SimTypeView.swift
//  EDS
//
//  Created by Not-clinton on 6/21/24.
//

import SwiftUI

struct SimTypePopupView: View {
    @Binding var showPopup: Bool
    @Binding var selectedOption: String?

    var body: some View {
        VStack {
            // Dismiss Button
            HStack {
                Spacer()
                Button(action: {
                    showPopup = false
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding()
                }
            }
            
           
            
            // Add the text under the image
            Text("Hi There")
                .font(.title)
                .padding(.top, 10)
            
            Text("Make sure you have all your means of \n Identification available before \n Commencing Registration.\n\n\nFollow the step-by-step process to \n complete your sim registration")
                .font(Font.custom("MTN Brighter Sans", size: 14))
                .kerning(0.3)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .top)
            

            // Yes and No Buttons
            HStack {
                Button(action: {
                    selectedOption = "Yes"
                    showPopup = false
                }) {
                    Text("Yes")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                }
                .padding(.horizontal, 10)

                Button(action: {
                    selectedOption = "No"
                    showPopup = false
                }) {
                    Text("No")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                }
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(24)
        .shadow(radius: 20)
        .padding(.horizontal, 20)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SimTypePopupView_Previews: PreviewProvider {
    @State static var showPopup = true
    @State static var selectedOption: String? = nil

    static var previews: some View {
        SimTypePopupView(showPopup: $showPopup, selectedOption: $selectedOption)
    }
}
