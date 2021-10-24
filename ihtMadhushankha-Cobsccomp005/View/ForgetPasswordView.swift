//
//  ForgetPasswordView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-24.
//

import SwiftUI

struct ForgetPasswordView: View {
    @State private var email:String = ""
    @State private var errorMessageForget = ""
    @State private var isActiveLinkForget = false

    var body: some View {
        ScrollView {
            VStack{
                Spacer()
                Image("forgetPassword")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top)
                    .frame(height:UIScreen.main.bounds.height/2.8)
                
                VStack(alignment: .leading, spacing: 30){
                    HStack{
                        TextTitle(title: ForgetPasswordViewStrings.lbl_forgetPassword, fontSize: 26, fontTitleWeight: .semibold)
                            .padding(.top, 20.0)
                        Spacer()
                    }
                    HStack{
                        TextTitle(title: ForgetPasswordViewStrings.lbl_titleForgetPassword, fontSize: 14, fontTitleWeight: .regular)
                            .padding([.trailing], 20.0)
                        Spacer()
                    }
                    TextFieldView(title: "Email Address", text: $email)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding([.top, .leading], 30.0)
                .padding(.bottom, 50.0)

                ButtonView(title: ForgetPasswordViewStrings.btn_submit,
                           function: {
                    
                },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
