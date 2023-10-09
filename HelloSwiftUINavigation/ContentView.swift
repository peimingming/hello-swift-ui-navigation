//
//  ContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI Navigation!")
                .font(.title)
            
            Spacer()
            
            Group {
                Text("Views and Preivews in the folder `SwiftUINavigationDemo` are from the official documentation:")
                Text("https://developer.apple.com/documentation/swiftui/navigation")
            }
            .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
