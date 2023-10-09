//
//  NavigationLinkContentView.swift
//  HelloSwiftUI
//
//  Created by 裴明明 on 2023/10/8.
//

import SwiftUI

struct NavigationLinkContentView: View {
    var body: some View {
        NavigationLink {
            Text("Destination")
        } label: {
            Label("Work Folder", systemImage: "folder")
        }
    }
}

#Preview("NavigationLink(destination:label)") {
    NavigationLinkContentView()
}

struct NavigationLinkContentView2: View {
    var body: some View {
        NavigationLink("Work Folder") {
            Text("Destination")
        }
    }
}

#Preview("NavigationLink(_ title:destination)") {
    NavigationLinkContentView2()
}

@available(iOS 16.0, *)
struct NavigationLinkContentView3: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Mint") {
                    ColorDetails(color: .mint)
                }
                NavigationLink("Pink") {
                    ColorDetails(color: .pink)
                }
                NavigationLink("Teal") {
                    ColorDetails(color: .teal)
                }
            }
            .navigationTitle("Colors")
        }
    }
}

@available(iOS 16.0, *)
#Preview("Link to a destination view") {
    NavigationLinkContentView3()
}

@available(iOS 16.0, *)
struct NavigationLinkContentView4: View {
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
#Preview("Create a presentation link") {
    NavigationLinkContentView4()
}

@available(iOS 16.0, *)
struct NavigationLinkContentView5: View {
    @State private var colors: [Color] = []
    
    var body: some View {
        NavigationStack(path: $colors) {
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
        
        Button("Show pink") {
            colors = [.pink]
        }
    }
}

@available(iOS 16.0, *)
#Preview("Control a presenation link programmatically") {
    NavigationLinkContentView5()
}

@available(iOS 16.0, *)
struct NavigationLinkContentView6: View {
    private let colors: [Color] = [.mint, .pink, .teal]
    @State private var selection: Color?
    
    var body: some View {
        NavigationSplitView {
            List(colors, id: \.self, selection: $selection) { color in
                NavigationLink(color.description, value: color)
            }
        } detail: {
            if let selection = selection {
                ColorDetails(color: selection)
            } else {
                Text("Pick a color")
            }
        }
        
        Spacer()
        
        Button("Pick pink (\(selection?.description ?? "N/A"))") {
            pickPink()
        }
    }
    
    func pickPink() {
        selection = .pink
    }
}

@available(iOS 16.0, *)
#Preview("Coordinate with a list") {
    NavigationLinkContentView6()
}
