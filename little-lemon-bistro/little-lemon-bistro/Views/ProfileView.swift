//
//  ProfileView.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 09/02/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var firstName: String = ""
    
    @State var lastName: String = ""
    
    @State var email: String = ""
    
    @State var phoneNumber: String = ""
    
    @State var isOrderStatuses = false
    
    @State var isPasswordChanges = false
    
    @State var isSpecialOffer = false
    
    @State var isNewsletter = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Personal Information")
                .font(.system(size: 15.0))
                .fontWeight(.semibold)
            Text("Avatar")
                .font(.system(size: 12.0))
                .foregroundColor(.gray)
            HStack(spacing: 16.0) {
                Image("v3_0121156")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0)
                    .cornerRadius(40.0)
                Button(action: {
                    print("Background Color")
                }, label: {
                    Text("Change")
                        .font(.system(size: 14.0))
                        .fontWeight(.semibold)
                        .padding(8.0)
                        .background(darkGreenColor)
                        .foregroundColor(.white)
                        .cornerRadius(6.0)
                })
                
                Button(action: {
                    print("Background Color")
                }, label: {
                    Text("Remove")
                        .font(.system(size: 14.0))
                        .fontWeight(.semibold)
                        .padding(8.0)
                        .background(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(lineWidth: 2)
                        )
                        .foregroundColor(darkGreenColor)
                        .cornerRadius(6.0)
                })
            }
            .padding(.bottom, 16.0)
            
            Group {
                Text("First name")
                    .font(.system(size: 12.0))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                TextField("First name", text: $firstName)
                    .font(.system(size: 14.0))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 16.0)
                Text("Last name")
                    .font(.system(size: 12.0))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                TextField("Last name", text: $lastName)
                    .font(.system(size: 14.0))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 16.0)
                Text("Email")
                    .font(.system(size: 12.0))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
                    .font(.system(size: 14.0))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 16.0)
                Text("Phone number")
                    .font(.system(size: 12.0))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                TextField("Phone number", text: $phoneNumber)
                    .font(.system(size: 14.0))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 16.0)
            }
            
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Email Notification")
                    .font(.system(size: 15.0))
                    .fontWeight(.semibold)
                Toggle("Order Statuses", isOn: $isOrderStatuses)
                    .toggleStyle(CheckBoxToggleStyle.checkbox)
                Toggle("Password changes", isOn: $isPasswordChanges)
                    .toggleStyle(CheckBoxToggleStyle.checkbox)
                Toggle("Special offers", isOn: $isSpecialOffer)
                    .toggleStyle(CheckBoxToggleStyle.checkbox)
                Toggle("Newsletter", isOn: $isNewsletter)
                    .toggleStyle(CheckBoxToggleStyle.checkbox)
            }
            
            Button(action: {
                print("Log out")
            }, label: {
                Text("Log out")
                    .font(.system(size: 14.0))
                    .fontWeight(.semibold)
                    .padding([.top, .bottom], 8.0)
                    .frame(maxWidth:.infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 6.0)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.orange)
                            .background(lemonColor)
                    )
                    .foregroundColor(.black)
                    .cornerRadius(6.0)
            })
            .padding([.top, .bottom], 16.0)
            
            HStack() {
                Spacer()
                Button(action: {
                    print("Background Color")
                }, label: {
                    Text("Discard changes")
                        .font(.system(size: 16.0))
                        .padding(8.0)
                        .background(
                            RoundedRectangle(cornerRadius: 6.0)
                                .stroke(lineWidth: 2)
                        )
                        .foregroundColor(darkGreenColor)
                        .cornerRadius(6.0)
                })
                Spacer()
                Button(action: {
                    print("Background Color")
                }, label: {
                    Text("Save changes")
                        .font(.system(size: 16.0))
                        .padding(8.0)
                        .background(darkGreenColor)
                        .foregroundColor(.white)
                        .cornerRadius(6.0)
                })
                Spacer()
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 0.0) {
                    Image("lemon")
                        .resizable()
                        .scaledToFit()
                        .frame(width:34.0, height:34.0)
                        .padding(.bottom, 4.0)
                    Text("LITTLE LEMON")
                        .font(.system(size: 12.0))
                        .fontWeight(.semibold)
                        .foregroundColor(darkGreenColor)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    NavigationLink(destination: ProfileView()) {
                        //Image(systemName: "dot.radiowaves.left.and.right")
                        Image("v3_0121156")
                            .resizable()
                            .scaledToFit()
                            .frame(width:36.0, height:36.0)
                            .cornerRadius(18.0)
                            .padding(.bottom, 8.0)
                    }
                }
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
