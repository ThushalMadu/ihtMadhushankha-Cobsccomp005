//
//  Tabs.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-30.
//

import SwiftUI

struct Tabs: View {
    var fixed = true
    var tabs: [Tab]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                VStack(spacing: 0) {
                                    HStack {
                                        // Image
                                        AnyView(tabs[row].icon)
                                            .foregroundColor(.blue)
                                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))

                                        // Text
                                        Text(tabs[row].title)
                                            .font(Font.system(size: 15, weight: .semibold))
                                            .foregroundColor(Color.blue)
                                            .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                    }
                                    .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 52)
                                    // Bar Indicator
                                    Rectangle().fill(selectedTab == row ? Color.blue : Color.clear)
                                        .frame(height: 3)
                                }.fixedSize()
                            })
                                .accentColor(Color.white)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) { target in
                        withAnimation {
                            proxy.scrollTo(target)
                        }
                    }
                }
            }
        }
        .frame(height: 55)
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = UIColor.white
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs(fixed: true,
             tabs: [.init(icon: Image(systemName: "star.fill"), title: "Tab 1"),
                    .init(icon: Image(systemName: "star.fill"), title: "Tab 2"),
                    .init(icon: Image(systemName: "star.fill"), title: "Tab 3")],
             geoWidth: 375,
             selectedTab: .constant(0))
    }
}
