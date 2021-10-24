//
//  SignUpView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email = ""
    @State private var name = ""
    @State private var nic = ""
    @State private var vehicleNumber = ""
    @State private var password = ""
    @State private var errorMessageSignUp = ""
    @State private var isActiveLinkSignIn = false
    
    var body: some View {
        ScrollView {
            VStack{
                Spacer()
                Image("signUpImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top)
                    .frame(height:UIScreen.main.bounds.height/3.7)
                
                VStack(alignment: .leading, spacing: 30){
                    HStack{
                        TextTitle(title: SignUpViewStrings.lbl_titleSignUp, fontSize: 30, fontTitleWeight: .semibold)
                        Spacer()
                    }
                    TextFieldView(title: "Full Name", text: $name)
                    TextFieldView(title: "Email Address", text: $email)
                    TextFieldView(title: "NIC", text: $nic)
                    TextFieldView(title: "Vehicle Number", text: $vehicleNumber)
                    SecureFieldView(title: "Password", text: $password)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding([.top, .leading, .bottom], 30.0)
                HStack {
                    TextTitle(title: SignUpViewStrings.lbl_TermsandCondition, fontSize: 14, fontTitleWeight: .regular, fontColor:Color.gray).multilineTextAlignment(.leading)
                        .padding([.leading, .bottom, .trailing], 30.0)
                    Spacer()
                }
                ButtonView(title: SignUpViewStrings.btn_signUp,
                           function: {
                    
                },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                NavigationLink(destination: SignUpView()
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), isActive:$isActiveLinkSignIn) {
                    Button(action: {
                        isActiveLinkSignIn.toggle()
                        
                    }) {
                        TextTitle(title: SignUpViewStrings.lbl_Haveacnt, fontSize: 14, fontTitleWeight: .regular, fontColor: Color.gray)
                            .padding(.top, 10.0)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
