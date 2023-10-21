//
//  NavigationBarContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct NavigationBarContentView: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    var body: some View {
        NavigationView {
            List(colors, id: \.self) { color in
                NavigationLink(color.description) {
                    ColorDetails(color: color)
                        .navigationBarBackButtonHidden()
                }
            }
            .navigationTitle("Colors")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview("Hide back button") {
    NavigationBarContentView()
}

struct NavigationBarContentView1: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    @State private var isTopTrailingGrouped = true
    @State private var isButtonItem = true
    
    var body: some View {
        NavigationView {
            VStack {
                List(colors, id: \.self) { color in
                    NavigationLink(color.description) {
                        CustomNavigationColorDetails(
                            color: color,
                            isTopTrailingGrouped: isTopTrailingGrouped, 
                            isButtonItem: isButtonItem
                        )
                    }
                }
                .navigationTitle("Colors")
                
                Picker(
                    "isTopTrailingGrouped",
                    selection: $isTopTrailingGrouped
                ) {
                    Text("ToolbarItemGroup as trailing view").tag(true)
                    Text("ToolbarItem as trailing view").tag(false)
                }
                
                Picker(
                    "isButtonItem",
                    selection: $isButtonItem
                ) {
                    Text("Button as trailing item").tag(true)
                    Text("NavigationLink as trailing item").tag(false)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview("Customize navigation bar items") {
    NavigationBarContentView1()
}
