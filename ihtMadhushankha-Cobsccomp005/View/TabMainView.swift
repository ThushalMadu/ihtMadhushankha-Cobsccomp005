//
//  TabMainView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct TabMainView: View {
    let userId = UserDefaults.standard.string(forKey: "userId")

    var body: some View {
        TabView {
            HomeTopTabView().tabItem {
                Image(systemName: "house")
                Text(TabMainViewString.lbl_Home).font(Font.custom("Poppins-Regular", size: 18))
            }.tag(1)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            if(userId == nil){
                LoginView().tabItem {
                    Image(systemName: "book")
                    Text("Login").font(Font.custom("Poppins-Regular", size: 18))
                }.tag(2)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                LoginView().tabItem {
                    Image(systemName: "person.circle")
                    Text("Login").font(Font.custom("Poppins-Regular", size: 18))
                }.tag(3)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            } else {
                BookView().tabItem {
                    Image(systemName: "book")
                    Text(TabMainViewString.lbl_Book).font(Font.custom("Poppins-Regular", size: 18))
                }.tag(2)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                SettingsView().tabItem {
                    Image(systemName: "person.circle")
                    Text(TabMainViewString.lbl_Settings).font(Font.custom("Poppins-Regular", size: 18))
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
