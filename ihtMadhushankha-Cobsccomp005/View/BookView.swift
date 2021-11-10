//
//  BookView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct BookView: View {
    @StateObject var settingViewModel = SettingsViewModel()
    let userId = UserDefaults.standard.string(forKey: "userId")
    @StateObject var viewModel = HomeViewModel()
    @State private var starRatingSelection: String = ""
    @StateObject var bookingViewModel = BookingViewModel()
    
    var body: some View {
        VStack{
            TopLeftTitle(title: BookViewString.lbl_Book).padding([ .leading], 20.0)
                .padding(.top, 60.0)
            Image("reserveBook")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top)
                .frame(height:UIScreen.main.bounds.height/4)
            TopLeftTitle(title: BookViewString.lbl_generalInfo,fontSize: 18).padding([.top, .leading], 20.0)
            VStack(alignment: .center, spacing: 30){
                BookingSingleGeneral(topTitle: BookViewString.lbl_regiNum, buttomTitle: userId!, imageName: "person.fill")
                BookingSingleGeneral(topTitle: BookViewString.lbl_vehiclNum, buttomTitle: settingViewModel.userData.first?.vehicleNumber ?? "no", imageName: "car.fill")
                if(settingViewModel.userData.first?.parkId == ""){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 2, x: 1, y: 3)
                            .frame(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/8, alignment: .center)
                        HStack {
                            TextTitle(title: BookViewString.lbl_selectPark, fontSize: 17, fontTitleWeight: .regular, fontColor:Color.black)
                                .padding(.leading, 20.0)
                            Spacer()
//                            Text("You selected: \(starRatingSelection)")
                            Section {
                                Picker("Park Slots", selection: $starRatingSelection) {
                                    ForEach(viewModel.parkModel, id: \.documentId) {
                                        //                                                    Text(object.parkName)
                                        if($0.parkCategory == "VIP"){
                                            TextTitle(title: $0.parkName, fontSize: 18, fontTitleWeight: .semibold, fontColor: Color.red)
                                        }else {
                                            TextTitle(title: $0.parkName, fontSize: 18, fontTitleWeight: .regular)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                } else {
                    HStack{
                        TopLeftTitle(title: BookViewString.lbl_parkSlotsDetails,fontSize: 18)
                        Spacer()
                        BookingSingleGeneral(topTitle: BookViewString.lbl_parkSlotsId, buttomTitle: settingViewModel.userData.first?.parkId ?? BookViewString.lbl_waiting, imageName: "parkingsign.circle.fill")
                    }
                }
            }.padding(.horizontal, 25.0)
            Spacer()
            if(settingViewModel.userData.first?.parkId == ""){
                VStack(alignment: .center){
                    ButtonView(title: BookViewString.btn_reserveSlot,
                               function: {
                        if(settingViewModel.userData.first?.status == "active" && starRatingSelection == ""){
                            bookingViewModel.updateDocument(documentId: starRatingSelection, userId: userId!)
                            settingViewModel.getJStoreUserFromDB(documentId: userId!)
                        } else {
                            print(BookViewString.err_cannotBook)
                        }
                        
                    },width:UIScreen.main.bounds.width/2,height: UIScreen.main.bounds.height/48)
                }
            } else {
                VStack(alignment: .center, spacing: 30){
                    ButtonView(title: BookViewString.btn_CancelResrve,
                               function: {
                        bookingViewModel.updateBookDocument(documentId: settingViewModel.userData.first!.parkId, userId: userId!)
                        settingViewModel.getJStoreUserFromDB(documentId: userId!)
                    },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                    ButtonView(title: BookViewString.btn_ScanQr,
                               function: {
                        
                    },width:UIScreen.main.bounds.width/2,height: UIScreen.main.bounds.height/48).padding(.bottom,30.0)
                }
                .padding(.vertical, 30.0)
            }
            Spacer()
            
        }.edgesIgnoringSafeArea(.top)
            .onAppear {
                settingViewModel.getJStoreUserFromDB(documentId: userId!)
                viewModel.fetchAllData()
            }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
