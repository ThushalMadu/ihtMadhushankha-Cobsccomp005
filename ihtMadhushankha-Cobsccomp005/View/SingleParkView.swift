//
//  SingleParkView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-30.
//

import SwiftUI

struct SingleParkView: View {
    var singleItem: ParkModel

    var body: some View {
        VStack {
            Spacer()
            HStack{
                TextTitle(title: SingleParkViewStrings.lbl_parkingDetails, fontSize: 30, fontTitleWeight: .semibold)
                Spacer()
            }              

            Image("singleViewImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:UIScreen.main.bounds.height/4)
            Spacer()
            HStack{
                TextTitle(title: SingleParkViewStrings.lbl_parkingSlotname, fontSize: 18, fontTitleWeight: .regular)
                Spacer()
                TextTitle(title: singleItem.parkName, fontSize: 18, fontTitleWeight: .regular)
            }
            .padding(.top)
            HStack{
                TextTitle(title: SingleParkViewStrings.lbl_parkingSlotBookingStatus, fontSize: 18, fontTitleWeight: .regular)
                Spacer()
                TextTitle(title: String(singleItem.booked), fontSize: 18, fontTitleWeight: .regular)
            }
            .padding(.top)
            HStack{
                TextTitle(title: SingleParkViewStrings.lbl_parkingSlotReserveStatus, fontSize: 18, fontTitleWeight: .regular)
                Spacer()
                TextTitle(title: String(singleItem.reserved), fontSize: 18, fontTitleWeight: .regular)
            }
            .padding(.top)
//            HStack{
//                TextTitle(title: SingleParkViewStrings.lbl_parkingSlotReserveStatus, fontSize: 18, fontTitleWeight: .regular)
//                Spacer()
//                TextTitle(title: SingleParkViewStrings.lbl_parkingSlotname, fontSize: 18, fontTitleWeight: .regular)
//            }
//            .padding(.top)
            Spacer()
            ButtonView(title: SingleParkViewStrings.btn_BookName,
                       function: {
            },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SingleParkView_Previews: PreviewProvider {
    @StateObject static var singleitm = HomeViewModel()

    static var previews: some View {
        SingleParkView(singleItem: singleitm.parkModel[0])
    }
}
