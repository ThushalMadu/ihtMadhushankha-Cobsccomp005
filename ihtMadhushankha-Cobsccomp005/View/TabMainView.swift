//
//  TabMainView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct TabMainView: View {
    let userId = UserDefaults.standard.string(forKey: UserDefaultKeyStrings.key_UserId)
    
    var body: some View {
        TabView {
            HomeTopTabView().tabItem {
                Image(systemName: ImageAssetsString.image_Home_HomeTab)
                Text(TabMainViewString.lbl_Home).font(Font.custom(FontCustomString.font_Poppins_Regular, size: 18))
            }.tag(1)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            if(userId == nil){
                LoginView().tabItem {
                    Image(systemName: ImageAssetsString.image_Home_BookButtomTab)
                    Text("Login").font(Font.custom(FontCustomString.font_Poppins_Regular, size: 18))
                }.tag(2)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                LoginView().tabItem {
                    Image(systemName: ImageAssetsString.image_Home_SettingsTab)
                    Text("Login").font(Font.custom(FontCustomString.font_Poppins_Regular, size: 18))
                }.tag(3)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            } else {
                BookView().tabItem {
                    Image(systemName: ImageAssetsString.image_Home_BookButtomTab)
                    Text(TabMainViewString.lbl_Book).font(Font.custom(FontCustomString.font_Poppins_Regular, size: 18))
                }.tag(2)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                SettingsView().tabItem {
                    Image(systemName: ImageAssetsString.image_Home_SettingsTab)
                    Text(TabMainViewString.lbl_Settings).font(Font.custom(FontCustomString.font_Poppins_Regular, size: 18))
                }.tag(3)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
            
        }.accentColor(Color.app_Blue)
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
