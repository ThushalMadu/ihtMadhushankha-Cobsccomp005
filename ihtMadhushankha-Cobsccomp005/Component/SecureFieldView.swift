//
//  SecureFieldView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import SwiftUI

struct SecureFieldView: View {
    var title:String
    @Binding var text:String
    var keyboardType = UIKeyboardType.default
    
    var body: some View {
        VStack{
            SecureField(title, text: $text)
                .autocapitalization(.none)
                .keyboardType(keyboardType)
                .textFieldStyle(TextViewStyle())
        }
        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 1, y: 2)
            )
    }
}

struct SecureFieldView_Previews: PreviewProvider {
    @State static var name:String = ""

    static var previews: some View {
        SecureFieldView(title: "qwew", text: $name)
    }
}
