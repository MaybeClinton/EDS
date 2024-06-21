//
//  SplashScreenView.swift
//  EDS
//
//  Created by Not-clinton on 6/17/24.
//
import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            // Background Image
            Image("SPLASH")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            // Foreground Image and Text
            VStack {
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 128, height: 128)
                    .padding(.top, 350)
                
                
                // New Welcome Text
                Text("Welcome to EBS’s Self Service Registration")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.top, 250) // Adjust the spacing as needed
                
                Spacer()

            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(viewModel: SplashViewModel(model: SplashModel()))
    }
}
