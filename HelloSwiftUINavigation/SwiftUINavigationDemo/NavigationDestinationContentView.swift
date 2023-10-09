//
//  NavigationDestinationContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

@available(iOS 16.0, *)
struct NavigationDestinationContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Pink", value: Color.pink)
                NavigationLink("Teal", value: Color.teal)
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetails(color: color)
            }
            .navigationTitle("Colors")
        }
    }
}

@available(iOS 16.0, *)
#Preview("navigationDestination(for:destination:)") {
    NavigationDestinationContentView()
}

@available(iOS 16.0, *)
struct NavigationDestinationContentView1: View {
    @State private var showDetails = false
    var favoriteColor: Color
    
    var body: some View {
        NavigationStack {
            VStack {
                Circle()
                    .fill(favoriteColor)
                Button("Show details") {
                    showDetails = true
                }
            }
            .navigationDestination(isPresented: $showDetails) {
                ColorDetails(color: favoriteColor)
            }
            .navigationTitle("My Favorite Color")
        }
        
        Text("showDetails = \(String(showDetails))")
    }
}

@available(iOS 16.0, *)
#Preview("navigationDestination(isPresented:destination:)") {
    NavigationDestinationContentView1(favoriteColor: .pink)
}

@available(iOS 17.0, *)
struct NavigationDestinationContentView2: View {
    @State private var colorShown: Color?
    
    var body: some View {
        NavigationSplitView {
            List {
                Button("Mint") { colorShown = .mint }
                Button("Pink") { colorShown = .pink }
                Button("Teal") { colorShown = .teal }
            }
            .navigationDestination(item: $colorShown) { color in
                ColorDetails(color: color)
            }
        } detail: {
            Text("Select a color")
        }
        
        Button("Pick pink (\(colorShown?.description ?? "N/A"))") {
            pickPink()
        }
    }
    
    func pickPink() {
        colorShown = .pink
    }
}

@available(iOS 17.0, *)
#Preview("navigationDestination(item:destination:)") {
    NavigationDestinationContentView2()
}
