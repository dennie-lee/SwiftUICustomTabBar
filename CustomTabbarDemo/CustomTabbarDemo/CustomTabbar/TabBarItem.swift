//
//  TabBarItem.swift
//  CustomTabbarDemo
//
//  Created by liqinghua on 2022/8/21.
//

import SwiftUI

//使用枚举的方式定义数据
enum TabBarItem: Hashable {
    case home, favorites, profile, messages
    //图标
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        case .messages: return "message"
        }
    }
    //标题
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        case .messages: return "Messages"
        }
    }
    //颜色
    var color: Color {
        switch self {
        case .home: return Color.blue
        case .favorites: return Color.red
        case .profile: return Color.green
        case .messages: return Color.orange
        }
    }
}
