//
//  BookView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI
import CoreLocation

struct BookView: View {
    @StateObject var settingViewModel = SettingsViewModel()
    let userId = UserDefaults.standard.string(forKey: UserDefaultKeyStrings.key_UserId)
    @StateObject var viewModel = HomeViewModel()
    //    @State private var starRatingSelection: String = ""
    @StateObject var bookingViewModel = BookingViewModel()
    @StateObject var locationManager = LocationManager()
    @State private var isActiveLinkQrScanner = false
    @State private var isCheckBangAlert = false
    @State private var alertErrorMessage = ""
    @State private var parkkId : String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TopLeftTitle(title: BookViewString.lbl_Book).padding([ .leading], 20.0)
                    .padding(.top, 60.0)
                Image(ImageAssetsString.image_Book_Main)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top)
                    .frame(height:UIScreen.main.bounds.height/4)
                TopLeftTitle(title: BookViewString.lbl_generalInfo,fontSize: 18).padding([.top, .leading], 20.0)
                if(settingViewModel.userData.first?.parkId != "" && settingViewModel.userData.first?.status == "parked"){
                    VStack(alignment: .center, spacing: 30){
                        BookingSingleGeneral(topTitle: BookViewString.lbl_regiNum, buttomTitle: userId!, imageName: ImageAssetsString.image_Book_Person)
                        BookingSingleGeneral(topTitle: BookViewString.lbl_vehiclNum, buttomTitle: settingViewModel.userData.first?.vehicleNumber ?? "no", imageName: ImageAssetsString.image_Book_Car)
                        BookingSingleGeneral(topTitle: BookViewString.lbl_parkSlotsId, buttomTitle: settingViewModel.userData.first?.parkId ?? BookViewString.lbl_waiting, imageName: ImageAssetsString.image_Book_ParkSign)
                        DoneReservationComp()
                    }.padding(.horizontal, 25.0)
                } else {
                    VStack(alignment: .center, spacing: 30){
                        if(bookingViewModel.parkDataLoader && settingViewModel.loaderSetting){
                            ProgressView(BookViewString.lbl_PleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.app_Blue)).scaleEffect(1, anchor: .center).accentColor(Color.app_Blue)
                        } else {
                            BookingSingleGeneral(topTitle: BookViewString.lbl_regiNum, buttomTitle: userId!, imageName: ImageAssetsString.image_Book_Person)
                            BookingSingleGeneral(topTitle: BookViewString.lbl_vehiclNum, buttomTitle: settingViewModel.userData.first?.vehicleNumber ?? "no", imageName: ImageAssetsString.image_Book_Car)
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
                                            Picker("Park Slots", selection: $bookingViewModel.parkDataIDFirst) {
                                                ForEach(bookingViewModel.parkModel, id: \.documentId) {
                                                    TextTitle(title: $0.parkName, fontSize: 18, fontTitleWeight: .regular)
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
                                    BookingSingleGeneral(topTitle: BookViewString.lbl_parkSlotsId, buttomTitle: settingViewModel.userData.first?.parkId ?? BookViewString.lbl_waiting, imageName: ImageAssetsString.image_Book_ParkSign)
                                }
                            }
                        }
                    }.padding(.horizontal, 25.0)
                    Spacer()
                    if(settingViewModel.userData.first?.parkId == ""){
                        VStack(alignment: .center){
                            ButtonView(title: BookViewString.btn_reserveSlot,
                                       function: {
                                print(locationManager.getLocationMetere())
                                if(settingViewModel.userData.first?.status == "active" && locationManager.getLocationMetere() < 1500 && bookingViewModel.parkDataIDFirst != ""){
                                    bookingViewModel.updateDocument(documentId: bookingViewModel.parkDataIDFirst, userId: userId!)
                                    settingViewModel.getJStoreUserFromDB(documentId: userId!)
                                } else {
                                    print(BookViewString.err_cannotBook)
                                    isCheckBangAlert = true
                                    alertErrorMessage = locationManager.getLocationMetere() > 1500 ? BookViewString.alert_EnterToArea  : bookingViewModel.parkDataIDFirst == "" ? BookViewString.alert_selectSlot : BookViewString.alert_UserBang
                                }
                            },width:UIScreen.main.bounds.width/2,height: UIScreen.main.bounds.height/48)
                                .padding(.top, 10.0)
                                .alert(isPresented: $isCheckBangAlert) { () -> Alert in
                                    Alert(title: Text(alertErrorMessage))
                                }
                        }
                    } else {
                        VStack(alignment: .center, spacing: 20){
                            ButtonView(title: BookViewString.btn_CancelResrve,
                                       function: {
                                bookingViewModel.updateBookDocument(documentId: settingViewModel.userData.first!.parkId, userId: userId!)
                                settingViewModel.getJStoreUserFromDB(documentId: userId!)
                            },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                            //                    NavigationLink(destination: ScannerView(), isActive:$isActiveLinkQrScanner) {
                            ButtonView(title: BookViewString.btn_ScanQr,
                                       function: {
                                isActiveLinkQrScanner = true
                            },width:UIScreen.main.bounds.width/2,height: UIScreen.main.bounds.height/48)
                                .sheet(isPresented: $isActiveLinkQrScanner) {
                                    ScannerView(parkkId: $bookingViewModel.parkDataIDFirst)
                                }
                            //                    }
                            
                        }
                        .padding(.top)
                    }
                    //                .padding(.vertical, 30.0)
                }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.top)
            .onAppear {
                print("Show Booking Buttom the screen")
                settingViewModel.getJStoreUserFromDB(documentId: userId!)
                bookingViewModel.fetchAllParkData()
                viewModel.updateUsersBangData()
                
            }
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}

