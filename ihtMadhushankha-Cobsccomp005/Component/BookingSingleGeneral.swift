//
//  BookingSingleGeneral.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-09.
//

import SwiftUI

struct BookingSingleGeneral: View {
    var topTitle:String
    var buttomTitle:String
    var imageName:String

    var body: some View {
        HStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:25, height:25)
                .foregroundColor(.black)
            VStack(alignment: .leading){
                TextTitle(title: topTitle, fontSize: 14, fontTitleWeight: .regular, fontColor: Color.gray)
                TextTitle(title: buttomTitle, fontSize: 16, fontTitleWeight: .regular, fontColor: Color.black)
            }
            .padding(.leading)
            Spacer()
        }
    }
}

struct BookingSingleGeneral_Previews: PreviewProvider {
    static var previews: some View {
        BookingSingleGeneral(topTitle: "", buttomTitle: "", imageName: "")
    }
}
