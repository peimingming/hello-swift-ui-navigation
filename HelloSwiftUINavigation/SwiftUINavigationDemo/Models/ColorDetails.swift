//
//  ColorDetails.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct ColorDetails: View {
    let color: Color
    
    var body: some View {
        color.navigationTitle(color.description)
    }
}
