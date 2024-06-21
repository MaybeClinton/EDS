//
//  WelcomeScreen.swift
//  EDS
//
//  Created by Not-clinton on 6/17/24.
//

import SwiftUI

struct WelcomeScreenView: View {
    @ObservedObject var viewModel: WelcomeViewModel
    @State private var showPopup = false

    var body: some View {
        ZStack {
            // Background Image
            Image("SPLASH") // Replace with your background image name
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            // Foreground Images and Text
            VStack {
               
                Image("EDSLOGO") // Replace with your first foreground image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 50) // Adjust size as needed
                    .padding(.bottom,-10)
                
                Text("Hello 👋 ")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Register your new sim")
                    .font(.title3)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Image("Image 1") // Replace with your second foreground image name
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 414, height: 576)
                    
                
                
                
                // Button to continue
                Button(action: {
                   showPopup.toggle()
                }) {
                    
                    Text("Let's get started")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: .infinity)
                        .background(Color(red: 0, green: 0.58, blue: 0.82))
                        .foregroundColor(.white)
                        .padding(.top, 1)
                        .padding(.horizontal,0)
                        .padding(.bottom,80)
                }
            }
            .padding()
            
            if showPopup {
                             Color.black.opacity(0.4)
                             .edgesIgnoringSafeArea(.all)
                            VStack {
                                    PopupView(showPopup: $showPopup)
                                    .transition(.move(edge: .bottom))
                                    .zIndex(1)
                }
            }
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView(viewModel: WelcomeViewModel())
    }
}
