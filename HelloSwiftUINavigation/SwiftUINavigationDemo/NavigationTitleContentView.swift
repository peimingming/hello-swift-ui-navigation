//
//  NavigationTitleContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct NavigationTitleContentView: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    var body: some View {
        NavigationView {
            List(colors, id: \.self) { color in
                NavigationLink(color.description) {
                    ColorDetails(color: color)
                }
            }
            .navigationTitle("Colors")
        }
    }
}

#Preview("navigationTitle(_:)") {
    NavigationTitleContentView()
}

@available(iOS 16.0, *)
struct NavigationTitleContentView1: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    @State private var title: String = "Colors"
    
    var body: some View {
        NavigationView {
            List(colors, id: \.self) { color in
                NavigationLink(color.description) {
                    ColorDetails(color: color)
                }
            }
            .navigationTitle($title)
        }
        
        Button("Update title") {
            title = "Some Colors"
        }
    }
}

@available(iOS 16.0, *)
#Preview("navigationTitle(_:) with Binding") {
    NavigationTitleContentView1()
}

@available(iOS 16.0, *)
struct NavigationTitleContentView2: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    var body: some View {
        NavigationView {
            VStack {
                List(colors, id: \.self) { color in
                    NavigationLink(color.description) {
                        ColorDetails(color: color)
                    }
                }
                .navigationTitle("Colors")
                // TODO: Test on a physical device and spike a custom document conforms to Transferable.
                // https://developer.apple.com/documentation/swiftui/configure-your-apps-navigation-titles
                .navigationDocument(URL(string: "https://www.baidu.com")!)
                
                Text("This is a demo for `navigationDocument(_:)` with document")
            }
        }
    }
}

@available(iOS 16.0, *)
#Preview("navigationDocument(_:) with document") {
    NavigationTitleContentView2()
}

struct NavigationTitleContentView3: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    var body: some View {
        NavigationView {
            VStack {
                List(colors, id: \.self) { color in
                    NavigationLink(color.description) {
                        ColorDetails(color: color)
                    }
                }
                .navigationTitle(Text("Colors\nSub title"))
                .navigationBarTitleDisplayMode(.inline)
                
                Text("This demo proves that the system modifier `navigationTitle(_:)` will only treat the first line of Text as the navigation title.")
            }
        }
    }
}

#Preview("navigationTitle(_:) with Text") {
    NavigationTitleContentView3()
}

struct NavigationTitleContentView4: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    var body: some View {
        NavigationView {
            List(colors, id: \.self) { color in
                NavigationLink(color.description) {
                    ColorDetails(color: color)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Colors").font(.headline)
                        Text("Subtitle").font(.subheadline)
                    }
                }
            }
        }
    }
}

#Preview("navigationTitle(_:) with multi-line title") {
    NavigationTitleContentView4()
}
