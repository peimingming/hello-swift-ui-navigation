//
//  CustomNavigationColorDetails.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/21.
//

import SwiftUI

struct CustomNavigationColorDetails: View {
    let color: Color
    let topTrailingType: TopTrailingType
    let topTrailingItemType: TopTrailingItemType
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var isDisplayingSubPage = false
    
    var body: some View {
        switch topTrailingItemType {
        case .button:
            switch topTrailingType {
            case .toolbarItemGroup:
                baseView
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            ForEach(0..<3) { _ in
                                barButton
                            }
                        }
                    }
            case .toolbarItem:
                baseView
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 8) {
                                ForEach(0..<3) { _ in
                                    barButton
                                }
                            }
                        }
                    }
            }
        case .navigationLink:
            switch topTrailingType {
            case .toolbarItemGroup:
                baseView
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            ForEach(0..<3) { _ in
                                barLink
                            }
                        }
                    }
            case .toolbarItem:
                baseView
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 8) {
                                ForEach(0..<3) { _ in
                                    barLink
                                }
                            }
                        }
                    }
            }
        }
    }
    
    private var baseView: some View {
        ScrollView {
            ColorDetails(color: color)
                .navigationBarBackButtonHidden()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(
                            action: {
                                // Pop.
                                presentationMode.wrappedValue.dismiss()
                            },
                            label: {
                                Image("custom.circle")
                                    .foregroundColor(.black)
                            }
                        )
                        .border(.black, width: 1)
                    }
                }
            NavigationLink(
                destination: Text("This is sub page."),
                isActive: $isDisplayingSubPage,
                label: { EmptyView() }
            )
        }
    }
    
    private var barItem: any View {
        switch topTrailingItemType {
        case .button:
            barButton
        case .navigationLink:
            barLink
        }
    }
    
    private var barButton: some View {
        Button(
            action: {
                // Go to a new page.
                isDisplayingSubPage.toggle()
            },
            label: {
                Image("custom.circle")
                    .foregroundColor(.black)
            }
        )
        .border(.black, width: 1)
    }
    
    private var barLink: some View {
        let destination = Text("This is a sub page navigated by a NavigationLink")
        return NavigationLink(destination: destination) {
            Image("custom.circle")
                .foregroundColor(.black)
        }
        .border(.black, width: 1)
    }
}

#Preview {
    CustomNavigationColorDetails(
        color: .red,
        topTrailingType: .toolbarItemGroup,
        topTrailingItemType: .button
    )
}
