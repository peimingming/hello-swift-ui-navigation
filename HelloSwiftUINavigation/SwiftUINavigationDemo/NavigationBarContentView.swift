//
//  NavigationBarContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct NavigationBarContentView: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    private static let introduction = """
    This demo is to hide the back button of the navigation bar.
    """
    
    var body: some View {
        NavigationView {
            VStack {
                List(colors, id: \.self) { color in
                    NavigationLink(color.description) {
                        ColorDetails(color: color)
                            .navigationBarBackButtonHidden()
                    }
                }
                .navigationTitle("Colors")
                .navigationBarTitleDisplayMode(.inline)
                
                Text(Self.introduction)
            }
        }
    }
}

#Preview("Hide back button") {
    NavigationBarContentView()
}

struct NavigationBarContentView1: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    @State private var topTrailingType: TopTrailingType = .toolbarItemGroup
    @State private var topTrailingItemType: TopTrailingItemType = .button
    
    private static let introduction = """
    This demo is for the customization of top leading and top trailing items in a navigation bar.
    """
    
    var body: some View {
        NavigationView {
            VStack {
                List(colors, id: \.self) { color in
                    NavigationLink(color.description) {
                        CustomNavigationColorDetails(
                            color: color,
                            topTrailingType: topTrailingType,
                            topTrailingItemType: topTrailingItemType
                        )
                    }
                }
                .navigationTitle("Colors")
                
                Text(Self.introduction)
                
                Picker(
                    "Top trailing type",
                    selection: $topTrailingType
                ) {
                    Text("ToolbarItemGroup as trailing view").tag(TopTrailingType.toolbarItemGroup)
                    Text("ToolbarItem as trailing view").tag(TopTrailingType.toolbarItem)
                }
                
                Picker(
                    "Top trailing item type",
                    selection: $topTrailingItemType
                ) {
                    Text("Button as trailing item").tag(TopTrailingItemType.button)
                    Text("NavigationLink as trailing item").tag(TopTrailingItemType.navigationLink)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview("Customize navigation bar items") {
    NavigationBarContentView1()
}
