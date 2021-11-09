//
//  TopLeftTitle.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct TopLeftTitle: View {
    var title:String
    var fontSize:CGFloat = 24

    var body: some View {
        HStack{
            TextTitle(title: title, fontSize: fontSize, fontTitleWeight: .semibold)
            Spacer()
        }
    }
}

struct TopLeftTitle_Previews: PreviewProvider {
    static var previews: some View {
        TopLeftTitle(title: "")
    }
}
