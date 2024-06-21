//
//  PopupView.swift
//  EDS
//
//  Created by Not-clinton on 6/18/24.
//

import SwiftUI

struct PopupView: View {
    @Binding var showPopup: Bool // Bind the showPopup state to control visibility

    var body: some View {
        VStack {
            Spacer()
            
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

                // Add the image at the top
                Image("info")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 80) // Adjust size as needed
                    .padding(.top, 10)
                
                // Add the text under the image
                Text("Hi There")
                    .font(.title)
                    .padding(.top, 10)
                
                Text("Make sure you have all your means of \n Identification available before \n Commencing Registration.\n\n\nFollow the step-by-step process to \n complete your sim registration")
                    .font(Font.custom("MTN Brighter Sans", size: 14))
                    .kerning(0.3)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom,24)
                
                
                Button(action: {
                    // Add your popup dismiss action here
                    showPopup = false
                }) {
                    Text("OK")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0, green: 0.58, blue: 0.82))
                        .foregroundColor(.white)
                        .cornerRadius(50)
                }
                
                .padding(.bottom, 80)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(24)
            .shadow(radius: 20)
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct PopupView_Previews: PreviewProvider {
    @State static var showPopup = true

    static var previews: some View {
        PopupView(showPopup: $showPopup)
    }
}
