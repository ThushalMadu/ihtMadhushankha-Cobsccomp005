//
//  TextTitle.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-23.
//

import SwiftUI

struct TextTitle: View {
    var title:String
    var fontSize:CGFloat
    var fontTitleWeight:Font.Weight
    var fontColor = Color.black

    var body: some View {
        Text(title)
            .font(Font.custom("Poppins-Regular", size: fontSize))
            .fontWeight(fontTitleWeight)
            .foregroundColor(fontColor)
            .accessibility(identifier: "Component_TextTile")
    }
}

struct TextTitle_Previews: PreviewProvider {
    static var previews: some View {
        TextTitle(title: "menu", fontSize: 20, fontTitleWeight: .semibold)
    }
}
