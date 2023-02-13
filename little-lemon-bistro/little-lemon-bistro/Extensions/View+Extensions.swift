//
//  View+Extensions.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 11/02/2023.
//

import SwiftUI

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}
