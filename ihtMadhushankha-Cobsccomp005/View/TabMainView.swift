//
//  TabMainView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-11-01.
//

import SwiftUI

struct TabMainView: View {
    var body: some View {
        TabView {
            HomeTopTabView().tabItem {
                Image(systemName: "house")
                Text(TabMainViewString.lbl_Home).font(Font.custom("Poppins-Regular", size: 18))
            }.tag(1)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
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
        }.accentColor(Color.app_Blue)
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
