//
//  SingleParkView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-30.
//

import SwiftUI
import Firebase

struct SingleParkView: View {
    var singleItem: ParkModel
    @StateObject var singleParkViewModel = SingleParkViewModel()
    @State var backButton: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                TextTitle(title: SingleParkViewStrings.lbl_parkingDetails, fontSize: 30, fontTitleWeight: .semibold)
                Spacer()
            }
            Image("singleViewImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top)
                .frame(height:UIScreen.main.bounds.height/7)
            Spacer()
            
            HStack{
                Spacer()
                if(singleItem.parkCategory == "VIP"){
                    TextTitle(title: singleItem.parkCategory, fontSize: 22, fontTitleWeight: .semibold, fontColor: Color.red)
                }else{
                    TextTitle(title: singleItem.parkCategory, fontSize: 22, fontTitleWeight: .semibold, fontColor: Color.green)
                }
                Spacer()
            }
            Group {
                SingleDetailRow(leftTitle: "Time", rightTitle: String("\(singleItem.bookTime.getFormattedDate(format: "MMM d, h:mm a"))"), leftFontSize: 18, leftFontTitleWeight: .semibold)
                    .padding(.top)
                SingleDetailRow(leftTitle: SingleParkViewStrings.lbl_parkingSlotname, rightTitle: singleItem.parkName, leftFontSize: 18, leftFontTitleWeight: .semibold)
                    .padding(.top)
                SingleDetailRow(leftTitle: SingleParkViewStrings.lbl_parkingSlotBookingStatus, rightTitle: singleItem.booked ? SingleParkViewStrings.lbl_alrdyBook : SingleParkViewStrings.lbl_avaliable, leftFontSize: 18, leftFontTitleWeight: .semibold, fontColor: singleItem.booked ? Color.orange : Color.blue)
                    .padding(.top)
                SingleDetailRow(leftTitle: SingleParkViewStrings.lbl_parkingSlotReserveStatus, rightTitle: singleItem.reserved ? SingleParkViewStrings.lbl_alrdyRseeved : SingleParkViewStrings.lbl_avaliable, leftFontSize: 18, leftFontTitleWeight: .semibold, fontColor: singleItem.reserved ? Color.orange : Color.blue)
                    .padding(.top)
            }
            Spacer()
            NavigationLink(destination: HomeTopTabView().navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true), isActive: $backButton) {
                ButtonView(title: singleItem.booked ? SingleParkViewStrings.btn_CancelBook : SingleParkViewStrings.btn_BookName,
                           function: {
                    if singleItem.booked {
                        singleParkViewModel.updateBookDocument(documentId: singleItem.documentId)
                    } else {
                        singleParkViewModel.updateDocument(documentId: singleItem.documentId)
                    }
                },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                    .padding(.bottom, 50.0).alert(isPresented: $singleParkViewModel.showSucessAlert, content: { () -> Alert in
                        Alert(title:  Text(singleItem.booked ? SingleParkViewStrings.alt_titleCancelBooking : SingleParkViewStrings.alt_titleBooking), message: Text(singleItem.booked ? SingleParkViewStrings.alt_messageCancelBooking : SingleParkViewStrings.alt_messageBooking), dismissButton: .default(Text(SingleParkViewStrings.btn_Dismiss), action: {
                            backButton = true
                        }))
                    })
            }
            
            //            Spacer()
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
