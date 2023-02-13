//
//  CheckBoxToggleStyle.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 12/02/2023.
//

import SwiftUI

extension ToggleStyle where Self == CheckBoxToggleStyle {
    static var checkbox: CheckBoxToggleStyle {
        return CheckBoxToggleStyle()
    }
}

// Custom Toggle Style
struct CheckBoxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
                    .font(.system(size: 14.0))
                    .foregroundColor(darkGreenColor)
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? darkGreenColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
