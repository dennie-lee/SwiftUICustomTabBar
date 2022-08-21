//
//  CustomTabBarContainerView.swift
//  CustomTabbarDemo
//
//  Created by liqinghua on 2022/8/21.
//

import SwiftUI

enum CustomTabBarStyle{
    case normal
    case line
}

struct CustomTabBarContainerView<Content:View>: View  {
    //选中的tabbar模块
    @Binding var selection: TabBarItem
    let style : CustomTabBarStyle
    //tabbar选项内容
    let content: Content
    //tabbar具体选项个数
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, style:CustomTabBarStyle,@ViewBuilder content: () -> Content) {
        self._selection = selection
        self.style = style
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
              //全屏内容
                content
                .ignoresSafeArea()
            //Tabbar选项容器
            CustomTabBarView(tabs: tabs, style: style,selection: $selection, localSelection: selection)
            } //: ZSTACK
        //通过preferenceKey和tabBarItem方法联动方式动态变化tabbar个数
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .favorites, .profile, .messages
    ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!),style: .normal) {
            Color.red
        }
    }
}
