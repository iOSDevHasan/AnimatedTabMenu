//
//  TabMenuHelper.swift
//  AnimatedTabMenu
//
//  Created by HASAN BERAT GURBUZ on 20.10.2024.
//

import SwiftUI

enum TabMenuHelper: String, CaseIterable {
    case homekit = "homekit"
    case heart = "heart"
    case search = "magnifyingglass"
    case profile = "person"
    
    var title: String {
        switch self {
        case .homekit:
            return "Home"
        case .heart:
            return "Heart"
        case .search:
            return "Search"
        case .profile:
            return "Profile"
        }
    }
}

struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: TabMenuHelper
    var isAnimating: Bool?
}
