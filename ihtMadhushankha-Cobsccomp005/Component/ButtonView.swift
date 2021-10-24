//
//  ButtonView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import SwiftUI

struct ButtonView: View {
    var title:String
    var function: () -> Void
    var width:CGFloat
    var height:CGFloat

    var body: some View {
        Button(action: {
            self.function()
        })
        {
            Text(title)
        }
        .accessibility(identifier: "Component_Button")
        .buttonStyle(ButtonViewStyle(definWidth: width, definHeight: height))
    }
}

struct ButtonView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ButtonView(title: "Save", function:{print("")},width: 300,height: 40)
    }
}
