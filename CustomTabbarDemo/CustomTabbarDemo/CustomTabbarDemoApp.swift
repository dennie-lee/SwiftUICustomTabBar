//
//  CustomTabbarDemoApp.swift
//  CustomTabbarDemo
//
//  Created by liqinghua on 2022/8/21.
//

import SwiftUI

@main
struct CustomTabbarDemoApp: App {
    @State private var tabSelection: TabBarItem = .home
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                CustomTabBarContainerView(selection: $tabSelection,style: .line) {
                    HomeView()
                        .background(Color.blue)
                        .tabBarItem(tab: .home, selection: $tabSelection)
                    
                    Color.red
                        .tabBarItem(tab: .favorites, selection: $tabSelection)
                    
                    Color.green
                        .tabBarItem(tab: .profile, selection: $tabSelection)
                    
                    Color.orange
                        .tabBarItem(tab: .messages, selection: $tabSelection)
                }
            })
            .navigationViewStyle(.stack)
        }
    }
}
