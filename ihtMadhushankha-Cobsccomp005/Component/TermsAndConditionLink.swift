//
//  TermsAndConditionLink.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-06.
//

import SwiftUI

struct TermsAndConditionLink: View {
    
    var function: () -> Void

    var body: some View {
        HStack{
            TextTitle(title: SignUpViewStrings.lbl_agreeTerm, fontSize: 14, fontTitleWeight: .regular, fontColor:Color.gray).multilineTextAlignment(.leading)
            Button(action: {
                self.function()
            }) {
                Text(SignUpViewStrings.lbl_TermsandCondition)
                    .font(Font.custom("Poppins-Regular", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct TermsAndConditionLink_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionLink(function: {print("")})
    }
}
