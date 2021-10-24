//
//  TextViewStyle.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-24.
//

import SwiftUI

struct TextViewStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: UIScreen.main.bounds.width/1.4, height: UIScreen.main.bounds.height/28)
            .padding([.top, .leading, .bottom], 10.0)
            .padding(.horizontal, 20.0)
            .cornerRadius(20)
        
    }
}
