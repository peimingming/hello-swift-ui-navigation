//
//  ContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/8.
//

import SwiftUI

struct ContentView: View {
    @State private var showDemo: Bool = false
    
    var body: some View {
        if showDemo {
            // Show demo here.
            NavigationViewContentView()
        } else {
            introductionView
        }
    }
    
    var introductionView: some View {
        VStack {
            Text("Hello, SwiftUI Navigation!")
                .font(.title)
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Views and Preivews in the folder `SwiftUINavigationDemo` are from the official documentation:")
                Text("https://developer.apple.com/documentation/swiftui/navigation")
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
