//
//  NoteEditor.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct NoteEditor: View {
    let id: String
    
    var body: some View {
        Text("Editing note with id: \(id)")
            .navigationTitle("Note \(id)")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NoteEditor(id: "2")
}
