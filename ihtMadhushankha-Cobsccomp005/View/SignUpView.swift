//
//  SignUpView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var errorMessageSignUp = ""
    @State private var errorOccured = false
    @State private var isActiveLinkSignIn = false
    @State private var isActiveLinkHome = false
    @StateObject var signUpViewModel = SignUpViewModel()
    
    @State var user = User()
    
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
                    TextFieldView(title: "Full Name", text: $user.name)
                    TextFieldView(title: "Email Address", text: $user.email)
                    TextFieldView(title: "NIC", text: $user.nic)
                    TextFieldView(title: "Vehicle Number", text: $user.vehicleNumber)
                    SecureFieldView(title: "Password", text: $user.password)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding([.top, .leading, .bottom], 30.0)
                HStack {
                    TextTitle(title: SignUpViewStrings.lbl_TermsandCondition, fontSize: 14, fontTitleWeight: .regular, fontColor:Color.gray).multilineTextAlignment(.leading)
                        .padding([.leading, .bottom, .trailing], 30.0)
                    Spacer()
                }
                
                if(signUpViewModel.loadHome){
                    ProgressView(SignUpViewStrings.pro_pleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.app_Blue)).scaleEffect(1, anchor: .center)
                } else {
                    NavigationLink(destination: TabMainView(), isActive:$signUpViewModel.isActiveHome) {
                        ButtonView(title: SignUpViewStrings.btn_signUp,
                                   function: {
                            defer{
                                print("finally try catch")
                            }
                            do {
                                try user.signUpValidate()
                                signUpViewModel.addUser(name: user.name, email: user.email, nic: user.nic, vehicleNumber: user.vehicleNumber, password: user.password)
                            } catch {
                                errorMessageSignUp = error.localizedDescription
                                errorOccured = true
                            }
                        },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                            .alert(isPresented: $errorOccured) { () -> Alert in
                                Alert(title: Text(errorMessageSignUp))
                            }
                    }
                }
                NavigationLink(destination: LoginView()
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
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
