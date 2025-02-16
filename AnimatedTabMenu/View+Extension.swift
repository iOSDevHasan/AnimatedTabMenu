//
//  View+Extension.swift
//  AnimatedTabMenu
//
//  Created by HASAN BERAT GURBUZ on 16.02.2025.
//

import SwiftUICore

extension View {
    @ViewBuilder
    func setUpTab(_ tab: TabMenuHelper) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
