//
//  HomeView.swift
//  CustomTabbarDemo
//
//  Created by liqinghua on 21.2.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack{
            NavigationLink {
                SecondView()
            } label: {
                Text("Home View")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    HomeView()
}
