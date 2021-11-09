//
//  ButtonViewStyle.swift
//  ihtMadhushankha-Cobsccomp005
//
//  Created by Thushal Madhushankha on 2021-10-25.
//

import SwiftUI

struct ButtonViewStyle: ButtonStyle {
    var backgroundColor1 = Color.app_Blue
    var backgroundColor2 = Color.white
    var definWidth:CGFloat = 300
    var definHeight:CGFloat = 40

    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: definWidth, height: definHeight, alignment: .center)
            .padding()
            .background(isEnabled ? backgroundColor1 : backgroundColor1.opacity(0.5))
            .clipShape(Capsule())
            .foregroundColor(isEnabled ? backgroundColor2 : backgroundColor2.opacity(0.5))
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .font(.title3)
    }
}

