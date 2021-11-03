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
    @State private var selectedColorIndex = 0
    @State private var starRatingSelection: String = ""
    let provinces = ["Western","Southern","Central","North Central"]
    @State private var selectedProvince = ""
    
    var body: some View {
        VStack{
            TopLeftTitle(title: "Booking").padding([ .leading], 20.0)
                .padding(.top, 60.0)
            Image("reserveBook")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top)
                .frame(height:UIScreen.main.bounds.height/4)
            VStack(alignment: .center, spacing: 10){
                SingleDetailRow(leftTitle: "Register Number", rightTitle: userId!, leftFontSize: 17, leftFontTitleWeight: .regular)
                SingleDetailRow(leftTitle: "Vehicle Number", rightTitle: settingViewModel.vehicleNumber, leftFontSize: 17, leftFontTitleWeight: .regular)
                HStack {
                    Spacer()
                    TextTitle(title: "Select Park Slot", fontSize: 14, fontTitleWeight: .regular, fontColor:Color.gray)
                        .padding(.leading, 25.0)
                    Spacer()
                    Picker("Please choose a Type", selection: $starRatingSelection) {
                        ForEach(viewModel.parkModel, id: \.documentId) { object in
                            Text(object.parkName)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                    //                Text(starRatingSelection)
                }
            }.padding(.horizontal, 15.0)
            Spacer()
            VStack(alignment: .center, spacing: 30){
                ButtonView(title: "Reserve Park Slot",
                           function: {
                    
                },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45)
                ButtonView(title: "Scan QR",
                           function: {
                    
                },width:UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/45).padding(.bottom,30.0)
            }
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
