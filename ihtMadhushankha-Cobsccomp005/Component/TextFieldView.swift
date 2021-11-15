//
//  TextFieldView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-24.
//

import SwiftUI

struct TextFieldView: View {
    var title:String
    @Binding var text:String
    var keyboardType = UIKeyboardType.default
    
    var body: some View {
        VStack{
            TextField(title, text: $text)
                .font(.custom("Poppins-Regular", size: 16))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .keyboardType(keyboardType)
                .textFieldStyle(TextViewStyle())
                .accessibility(identifier: "Component_TextView")

        }
        .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 1, y: 2)
            )
    }
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var name:String = ""

    static var previews: some View {
        TextFieldView(title: "qwew", text: $name)
    }
}
