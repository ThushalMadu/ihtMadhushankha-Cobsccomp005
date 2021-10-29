//
//  HomeTopTabView.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-30.
//

import SwiftUI

struct HomeTopTabView: View {
    @State private var selectedTab: Int = 0
    
    let tabs: [Tab] = [
        .init(icon: Image(systemName: "folder.badge.plus"), title: "Avaliable"),
        .init(icon: Image(systemName: "film.fill"), title: "Book"),
        .init(icon: Image(systemName: "book.fill"), title: "Reservation")
    ]
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    // Tabs
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab)
                    
                    // Views
                    TabView(selection: $selectedTab,
                            content: {
                        HomeView(type: "Avaliable")
                            .tag(0)
                        HomeView(type: "Book")
                            .tag(1)
                        HomeView(type: "Reservation")
                            .tag(2)
                    })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct HomeTopTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopTabView()
    }
}
