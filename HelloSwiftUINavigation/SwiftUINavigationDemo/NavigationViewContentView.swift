//
//  NavigationViewContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct NavigationViewContentView: View {
    private let notes: [Note] = [
        .init(id: "1", title: "Note 1"),
        .init(id: "2", title: "Note 2"),
        .init(id: "3", title: "Note 3")
    ]
    
    enum ViewType {
        case note
        case color
    }
    
    let viewType: ViewType
    
    init(viewType: ViewType = .note) {
        self.viewType = viewType
    }
        
    var body: some View {
        switch viewType {
        case .note:
            NavigationView {
                List(notes, id: \.self) { note in
                    NavigationLink(note.title, destination: NoteEditor(id: note.id))
                }
                .navigationTitle("Notes")
                
                // Any views after the first act as placeholders for corresponding columns in a multicolumn display.
                // See official document: https://developer.apple.com/documentation/swiftui/navigationview/init(content:)#parameters
                Text("Select a note")
            }
        case .color:
            NavigationView {
                List {
                    NavigationLink("Purple", destination: ColorDetails(color: .purple))
                    NavigationLink("Pink", destination: ColorDetails(color: .pink))
                    NavigationLink("Orange", destination: ColorDetails(color: .orange))
                }
                .navigationTitle("Colors")
                
                Text("Select a color") // A placeholder to show before selection.
            }
        }
    }
}

#Preview("NavigationView init (note demo)") {
    NavigationViewContentView(viewType: .note)
}

#Preview("NavigationView init (color demo)") {
    NavigationViewContentView(viewType: .color)
}

#Preview("NavigationView view style (stack)") {
    NavigationViewContentView(viewType: .color)
        .navigationViewStyle(.stack)
}

#Preview("NavigationView view style (columns)") {
    if #available(iOS 15.0, *) {
        NavigationViewContentView(viewType: .color)
            .navigationViewStyle(.columns)
    } else {
        NavigationViewContentView(viewType: .color)
            .navigationViewStyle(.automatic)
    }
}
