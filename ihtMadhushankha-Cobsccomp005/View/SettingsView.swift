//
//  SettingsView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var settingViewModel = SettingsViewModel()
    let userId = UserDefaults.standard.string(forKey: UserDefaultKeyStrings.key_UserId)
    @StateObject var viewModel = HomeViewModel()
    @StateObject private var userAuth = UserAuth()
    
    var body: some View {
        ScrollView{
            VStack{
                TopLeftTitle(title: SettingViewString.lbl_settings).padding([.leading], 15.0)
                    .padding(.top, 60.0)
                Image(ImageAssetsString.image_Settings_Main)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 3)
                    .frame(width: 200, height: 200, alignment: .center)
                if(settingViewModel.loaderSetting){
                    ProgressView(SettingViewString.lbl_PleaseWait).progressViewStyle(CircularProgressViewStyle(tint: Color.app_Blue)).scaleEffect(1, anchor: .center).accentColor(Color.app_Blue)
                } else {
                    VStack(alignment: .leading, spacing: 20){
                        TopLeftTitle(title: SettingViewString.lbl_generalInfo,fontSize: 18)
                        BookingSingleGeneral(topTitle: SettingViewString.lbl_RegiNumber, buttomTitle: userId!, imageName: ImageAssetsString.image_Settings_Grid)
                        BookingSingleGeneral(topTitle: SettingViewString.lbl_Name, buttomTitle: settingViewModel.userData.first?.name ?? "no", imageName: ImageAssetsString.image_Settings_Dail)
                        BookingSingleGeneral(topTitle: SettingViewString.lbl_Email, buttomTitle: settingViewModel.userData.first?.email ?? "no", imageName: ImageAssetsString.image_Settings_Envolpe)
                        BookingSingleGeneral(topTitle: SettingViewString.lbl_VehicleNum, buttomTitle: settingViewModel.userData.first?.vehicleNumber ?? "no", imageName: ImageAssetsString.image_Settings_Car)
                        BookingSingleGeneral(topTitle: SettingViewString.lbl_Nic, buttomTitle: settingViewModel.userData.first?.nic ?? "no", imageName: ImageAssetsString.image_Settings_MenuCad)
                    }
                    .padding(.leading, 15.0)
                    .padding(.trailing, 15.0)
                }
                NavigationLink(destination: TabMainView(), isActive:$userAuth.isLoggedOut) {
                    LogOutButtonView(function: {
                        userAuth.logout()
                    })
                }
                .padding(.bottom, 30.0)
                Spacer()
            }
        }.edgesIgnoringSafeArea(.top)
            .onAppear {
                viewModel.updateUsersBangData()
                settingViewModel.getJStoreUserFromDB(documentId: userId!)
            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
