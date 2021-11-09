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
//        .init(icon: Image(systemName: "book.fill"), title: "Reservation")
    ]
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
    }
    
    var body: some View {
//        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    // Tabs
                    TopLeftTitle(title: "Welcome NIBM Parking").padding([.leading], 15.0)
                        .padding(.top, 60.0)
                    Tabs(tabs: tabs, geoWidth: geo.size.width, selectedTab: $selectedTab).padding(.top, 20.0)

                    // Views
                    TabView(selection: $selectedTab,
                            content: {
                        HomeView(type: "Avaliable")
                            .tag(0)
                        HomeView(type: "Book")
                            .tag(1)
//                        HomeView(type: "Reservation")
//                            .tag(2)
                    })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
                .edgesIgnoringSafeArea(.top)
            }
//        }
    }
}

struct HomeTopTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopTabView()
    }
}
