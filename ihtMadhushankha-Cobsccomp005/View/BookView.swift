//
//  BookView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct BookView: View {
    var body: some View {
        VStack{
            TopLeftTitle(title: "Booking").padding([ .leading], 15.0)
                .padding(.top, 60.0)
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
