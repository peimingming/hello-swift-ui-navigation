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
    This demo is for the customization:
    1. background color.
    2. bottom divider color for standard and scroll apperance.
    3. top leading and top trailing items in a navigation bar.
    """
    
    init() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithTransparentBackground()
        standardAppearance.backgroundColor = .green
        standardAppearance.backgroundImage = UIImage()
        standardAppearance.shadowColor = .red
        standardAppearance.shadowImage = UIImage()
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        scrollEdgeAppearance.backgroundColor = .green
        scrollEdgeAppearance.backgroundImage = UIImage()
        scrollEdgeAppearance.shadowColor = .clear
        scrollEdgeAppearance.shadowImage = UIImage()
        UINavigationBar.appearance().standardAppearance = standardAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
    }
    
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
