//
//  NavigationViewContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct NavigationViewContentView: View {
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

#Preview {
    NavigationViewContentView()
}
