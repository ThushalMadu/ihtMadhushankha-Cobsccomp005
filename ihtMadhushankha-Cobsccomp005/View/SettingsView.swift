//
//  SettingsView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var settingViewModel = SettingsViewModel()
    let userId = UserDefaults.standard.string(forKey: "userId")

    var body: some View {
        VStack{
            TopLeftTitle(title: "Settings").padding([.leading], 15.0)
                .padding(.top, 60.0)
            VStack(alignment: .leading, spacing: 20){
                SingleDetailRow(leftTitle: "Register Number", rightTitle: userId!, leftFontSize: 17, leftFontTitleWeight: .regular)
                    .padding(.top)
                SingleDetailRow(leftTitle: "Name", rightTitle: settingViewModel.name, leftFontSize: 17, leftFontTitleWeight: .regular)
                    .padding(.top)
                SingleDetailRow(leftTitle: "Email", rightTitle: settingViewModel.email, leftFontSize: 17, leftFontTitleWeight: .regular)
                    .padding(.top)
                SingleDetailRow(leftTitle: "Vehicle Number", rightTitle: settingViewModel.vehicleNumber, leftFontSize: 17, leftFontTitleWeight: .regular)
                    .padding(.top)
                SingleDetailRow(leftTitle: "NIC", rightTitle: settingViewModel.nic, leftFontSize: 17, leftFontTitleWeight: .regular)
                    .padding(.top)
            }
            .padding(.top, 30.0)
            .padding(.leading, 15.0)
            .padding(.trailing, 15.0)
            Spacer()
                
        }.edgesIgnoringSafeArea(.top)
            .onAppear {
                settingViewModel.getJStoreUserFromDB(documentId: userId!)
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
