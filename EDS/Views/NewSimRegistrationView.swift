import SwiftUI

struct NewSIMRegistrationView: View {
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

struct NewSIMRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NewSIMRegistrationView()
    }
}
