//
//  LoginView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var errorMessageLogin = ""
    @State private var errorOccured = false
    @State private var isActiveLinkSignUp = false
    @State private var isActiveLinkForget = false
    @StateObject var loginViewModel = LoginViewModel()
    @State var user = User()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
                Image("signInImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top)
                    .frame(height:UIScreen.main.bounds.height/3.7)
                    .padding(.top, 40.0).accessibility(identifier: "LoginView_ImageView")
                
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        TextTitle(title: LoginViewStrings.lbl_titleSignIn, fontSize: 30, fontTitleWeight: .semibold).accessibility(identifier: "LoginView_TextView")
                            .padding(.top, 20.0)
                        Spacer()
                    }
                    TextFieldView(title: LoginViewStrings.lbl_email, text: $user.email).accessibility(identifier: "LoginView_EmailField")
                    SecureFieldView(title: LoginViewStrings.lbl_password, text: $user.password).accessibility(identifier: "LoginView_PassField")
                    HStack{
                        Spacer()
                        NavigationLink(destination: ForgetPasswordView(), isActive:$isActiveLinkForget) {
                            Button {
                                isActiveLinkForget = true
                            } label: {
                                TextTitle(title: LoginViewStrings.lbl_forgetPassword, fontSize: 14, fontTitleWeight: .regular)
                                    .padding(.trailing, 30.0)
                            }.accessibility(identifier: "LoginView_ForgetButton")
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding([.top, .leading, .bottom], 30.0)
                
                if(loginViewModel.loadHome){
                    ProgressView(LoginViewStrings.pro_pleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.app_Blue)).scaleEffect(1, anchor: .center)
                } else{
                    NavigationLink(destination: TabMainView(), isActive:$loginViewModel.isActiveLoginHome) {
                        ButtonView(title: LoginViewStrings.btn_signIn,
                                   function: {
                            defer{
                                print("finally try catch")
                            }
                            do {
                                try user.signInValidate()
                                loginViewModel.signIn(email: user.email, password: user.password)
                            } catch {
                                //                                    errorMessageLogin = error.localizedDescription
                                //                                    errorOccured = true
                                loginViewModel.errorMessageLogin = error.localizedDescription
                                loginViewModel.errorAlert = true
                            }
                        },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45).accessibility(identifier: "LoginView_LoginButton")
                            .alert(isPresented: $loginViewModel.errorAlert) { () -> Alert in
                                Alert(title: Text(loginViewModel.errorMessageLogin))
                            }
                        //                                .alert(isPresented: $loginViewModel.errorAlert) { () -> Alert in
                        //                                    Alert(title: Text(loginViewModel.errorMessageLogin))
                        //                                }
                    }
                    
                }
                Spacer()
                
                LabelledDivider(label: "OR").padding(.top, 10.0).accessibility(identifier: "LoginView_OrLabel")
                NavigationLink(destination: SignUpView(), isActive:$isActiveLinkSignUp) {
                    Button(action: {
                        isActiveLinkSignUp.toggle()
                    }) {
                        TextTitle(title: LoginViewStrings.lbl_dontHaveacnt, fontSize: 14, fontTitleWeight: .regular, fontColor: Color.gray)
                            .padding(.top, 5.0)
                    }.accessibility(identifier: "LoginView_NewUserButton")
                }
            }
            //            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
