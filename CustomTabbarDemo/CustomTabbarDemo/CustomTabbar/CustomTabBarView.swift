//
//  CustomTabBarView.swift
//  CustomTabbarDemo
//
//  Created by liqinghua on 2022/8/21.
//

import SwiftUI

struct CustomTabBarView: View {
    // MARK: -  属性
    let tabs: [TabBarItem]
    let style : CustomTabBarStyle
    @Binding  var selection: TabBarItem
    @Namespace private var namespace
    //用于动画
    @State var localSelection: TabBarItem
    
    // MARK: -  内容
    var body: some View {
        if style == .normal{
            tabBarVersionOne
                .onChange(of: selection) { newValue in
                    withAnimation(.easeInOut) {
                        localSelection = newValue
                    }
                }
        }else{
            tabBarVersionTwo
                .onChange(of: selection) { newValue in
                    withAnimation(.easeInOut) {
                        localSelection = newValue
                    }
                }
        }
        
    }
}

//预览代码
struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [TabBarItem] = [
        .home, .favorites, .profile
    ]
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, style: .normal,selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

// MARK: -  扩展
//样式1
extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        } //: VSTACK
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersionOne: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        } //: HSTACK
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: TabBarItem) {
            selection = tab
    }
}

// 样式2
extension CustomTabBarView {
    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        } //: VSTACK
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            } //: ZSTACK
        )
    }
    
    private var tabBarVersionTwo: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        } //: HSTACK
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
}

