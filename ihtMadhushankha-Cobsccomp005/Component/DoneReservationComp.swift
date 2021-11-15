//
//  DoneReservationComp.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-16.
//

import SwiftUI

struct DoneReservationComp: View {
    var body: some View {
        HStack{
            Text("Reserved Park Slot")
                .font(Font.custom("Poppins-Medium", size: 22))
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            Image(systemName: "checkmark.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:30, height:30)
                .foregroundColor(.green)
        }
    }
}

struct DoneReservationComp_Previews: PreviewProvider {
    static var previews: some View {
        DoneReservationComp()
    }
}
