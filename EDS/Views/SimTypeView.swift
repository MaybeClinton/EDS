////
////  SimTypeView.swift
////  EDS
////
////  Created by Not-clinton on 6/21/24.
////
//
//import SwiftUI
//
//struct SimTypeView: View {
//    @ObservedObject var viewModel: SimTypeViewModel
//
//    var body: some View {
//        ZStack {
//            VStack {
//                Spacer()
//                    .frame(height: 20)
//
//                // Title
//                Text("Select SIM Type")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.top, 20)
//
//                Spacer()
//                    .frame(height: 10)
//
//                // Description Text
//                Text("Select the user")
//                    .font(.title2)
//                    .padding(.top, 10)
//                    .multilineTextAlignment(.center)
//
//
//                // Physical SIM Button
//                Button(action: {
//                    viewModel.showPopup = true
//                }) {
//                    Text("Physical SIM")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .padding(.horizontal, 50)
//                        .padding(.bottom, 50)
//                }
//
//                Spacer()
//            }
//            .padding()
//
//            // Popup View
//            if viewModel.showPopup {
//                Color.black.opacity(0.4)
//                    .edgesIgnoringSafeArea(.all)
//
//                VStack {
//                    Spacer()
//                    SimTypePopupView(showPopup: $viewModel.showPopup, selectedOption: $viewModel.selectedOption)
//                        .transition(.move(edge: .bottom))
//                        .zIndex(1)
//                }
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//struct SimTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimTypeView(viewModel: SimTypeViewModel())
//    }
//}
import SwiftUI

struct SimTypeView: View {
    @State private var selectedUserType: String?
    @State private var showingNINPopup = false
    @State private var ninNumber = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color(red: 0, green: 0.58, blue: 0.82))
                            .imageScale(.large)
                    }
                    .padding(.leading)
                    Spacer()
                }
                .padding(.top)
                
                Text("New SIM Registration")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("Select the User Identity Type you want to use for your registration")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Button(action: {
                    self.selectedUserType = "National"
                    self.showingNINPopup = true
                }) {
                    HStack {
                        Text("National")
                            .fontWeight(.semibold)
                        Spacer()
                        if selectedUserType == "National" {
                            Image(systemName: "checkmark")
                        }
                    }
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color(red: 0, green: 0.58, blue: 0.82))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .alert(isPresented: $showingNINPopup) {
                Alert(
                    title: Text("Enter NIN"),
                    message: Text("Please enter your 11-digit National Identification Number"),
                    primaryButton: .default(Text("OK"), action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            UIApplication.shared.windows.first?.rootViewController?.present(UIHostingController(rootView: NINInputView(ninNumber: $ninNumber)), animated: true, completion: nil)
                        }
                    }),
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

struct NINInputView: View {
    @Binding var ninNumber: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter 11-digit NIN", text: $ninNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Submit") {
                    // Handle NIN submission here
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .background(Color(red: 0, green: 0.58, blue: 0.82))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .navigationBarTitle("Enter NIN", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct SimTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SimTypeView(viewModel: SimTypeViewModel())
    }
}
