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

#Preview {
    NavigationBarContentView()
}

struct NavigationBarContentView1: View {
    private let colors: [Color] = [.red, .yellow, .blue]
    
    var body: some View {
        NavigationView {
            List(colors, id: \.self) { color in
                NavigationLink(color.description) {
                    ColorDetails(color: color)
                        .navigationBarBackButtonHidden()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(
                            leading: Button(
                                "123",
                                systemImage: "chevron.backward",
                                action: {
                                    // pop
                                }
                            ),
                            trailing: Image(systemName: "folder")
                        )
                }
            }
            .navigationTitle("Colors")
        }
    }
}

#Preview("Customize navigation bar items") {
    NavigationBarContentView1()
}
