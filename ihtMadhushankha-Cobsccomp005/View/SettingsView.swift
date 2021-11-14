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
            TopLeftTitle(title: SettingViewString.lbl_settings).padding([.leading], 15.0)
                .padding(.top, 60.0)
            Image("menuseLap")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 3)
                .frame(width: 200, height: 200, alignment: .center)
            VStack(alignment: .leading, spacing: 20){
                TopLeftTitle(title: SettingViewString.lbl_generalInfo,fontSize: 18)
                BookingSingleGeneral(topTitle: "Register Number", buttomTitle: userId!, imageName: "grid")
                BookingSingleGeneral(topTitle: "Name", buttomTitle: settingViewModel.userData.first?.name ?? "no", imageName: "dial.min")
                BookingSingleGeneral(topTitle: "Email", buttomTitle: settingViewModel.userData.first?.email ?? "no", imageName: "envelope")
                BookingSingleGeneral(topTitle: "Vehicle Number", buttomTitle: settingViewModel.userData.first?.vehicleNumber ?? "no", imageName: "car")
                BookingSingleGeneral(topTitle: "NIC", buttomTitle: settingViewModel.userData.first?.nic ?? "no", imageName: "menucard")
            }
            .padding(.leading, 15.0)
            .padding(.trailing, 15.0)
            LogOutButtonView().padding(.top, 30.0)
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
