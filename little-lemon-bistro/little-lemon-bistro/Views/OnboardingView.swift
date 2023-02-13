//
//  SignInView.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 09/02/2023.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var firstName: String = ""
    
    @State var lastName: String = ""
    
    @State var email: String = ""
    
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true),
                               isActive: $isActive) {
                    EmptyView()
                }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Welcome")
                VStack(alignment: .leading) {
                    Text("First name")
                    TextField("First name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Last name")
                    TextField("Last name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Email")
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                }
                Button(action: {
                    UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                    isActive.toggle()
                }) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .frame(width: 180, height: 44)
                        .background(.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(22)
                }
                .disabled(firstName.isEmpty || lastName.isEmpty || email.isEmpty)
            }
            .padding()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
