//
//  Home.swift
//  AnimatedTabMenu
//
//  Created by HASAN BERAT GURBUZ on 20.10.2024.
//

import SwiftUI

struct Home: View {

    // MARK: - PROPERTIES

    @State private var activeTab: TabMenuHelper = .homekit
    @State private var allTabs: [AnimatedTab] = TabMenuHelper.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    
    // MARK: - BODY

    var body: some View {
        VStack {
            TabView(selection: $activeTab,
                    content: {
                        NavigationStack {
                            VStack {
                                // Add content for homekit tab
                            }
                            .navigationTitle(TabMenuHelper.homekit.title)
                        }
                        .setUpTab(.homekit)
                        
                        NavigationStack {
                            VStack {
                                // Add content for heart tab
                            }
                            .navigationTitle(TabMenuHelper.heart.title)
                        }
                        .setUpTab(.heart)
                        
                        NavigationStack {
                            VStack {
                                // Add content for search tab
                            }
                            .navigationTitle(TabMenuHelper.search.title)
                        }
                        .setUpTab(.search)
                        
                        NavigationStack {
                            VStack {
                                // Add content for profile
                            }
                            .navigationTitle(TabMenuHelper.profile.title)
                        }
                        .setUpTab(.profile)
                    })
            CustomTabBar()
        }
    }
    
    // MARK: - CUSTOMTABBAR VIEW

    private func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(.bounce.up.wholeSymbol, value: animatedTab.isAnimating)
                    Text(tab.title)
                        .font(.title2)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    } completion: {
                        var transition = Transaction()
                        transition.disablesAnimations = true
                        withTransaction(transition) {
                            animatedTab.isAnimating = nil
                        }
                    }
                }
            }
        }
        // This is only for iOS 17 or +
        .background(.bar)
    }
}

// MARK: - PREIVEW

#Preview {
    ContentView()
}
