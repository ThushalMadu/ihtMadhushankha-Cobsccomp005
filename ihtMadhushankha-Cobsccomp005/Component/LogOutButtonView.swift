//
//  LogOutButtonView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-06.
//

import SwiftUI

struct LogOutButtonView: View {
    var function: () -> Void

    var body: some View {
        Button(action: {
            self.function()
        }) {
            HStack{
                Text(SettingViewString.btn_LogOut)
                    .font(Font.custom(FontCustomString.font_Poppins_Regular, size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.red)
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:25, height:25)
                    .foregroundColor(.red)
            }
        } .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/45, alignment: .center)
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
    }
}
struct LogOutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButtonView(function: {print("done")})
    }
}

