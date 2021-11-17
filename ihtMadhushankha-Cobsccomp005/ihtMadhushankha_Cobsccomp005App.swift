//
//  ihtMadhushankha_Cobsccomp005App.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-23.
//

import SwiftUI
import Firebase

@main
struct ihtMadhushankha_Cobsccomp005App: App {
    init() {
           FirebaseApp.configure()
       }
    let userId = UserDefaults.standard.string(forKey: "userId")

    var body: some Scene {
        WindowGroup {
            NavigationView{
                TabMainView()
            }

        }
    }
}
