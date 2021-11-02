//
//  SingleDetailRow.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-30.
//

import SwiftUI

struct SingleDetailRow: View {
    
    var leftTitle:String
    var rightTitle:String
    var leftFontSize:CGFloat
    var leftFontTitleWeight:Font.Weight
    var fontColor = Color.black
    
    var body: some View {
        HStack{
            TextTitle(title: leftTitle, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.gray)
            Spacer()
            TextTitle(title: rightTitle, fontSize: leftFontSize, fontTitleWeight: leftFontTitleWeight, fontColor: fontColor)
        }
    }
}

struct SingleDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleDetailRow(leftTitle: "", rightTitle: "", leftFontSize: 20, leftFontTitleWeight: .semibold)
    }
}
