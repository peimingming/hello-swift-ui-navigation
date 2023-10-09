//
//  NavigationStackContentView.swift
//  HelloSwiftUINavigation
//
//  Created by 裴明明 on 2023/10/9.
//

import SwiftUI

struct Park: Hashable {
    let name: String
    
    static let parks: [Park] = [
        .init(name: "Yosemite"),
        .init(name: "Sequoia"),
        .init(name: "Yunshui")
    ]
}

struct ParkDetails: View {
    let park: Park
    
    var body: some View {
        Text(park.name)
            .font(.title)
        Text("Here is \(park.name)'s description: xxx")
    }
}

@available(iOS 16.0, *)
struct NavigationStackContentView: View {
    var body: some View {
        NavigationStack {
            List(Park.parks, id: \.self) { park in
                NavigationLink(park.name, value: park)
            }
            .navigationDestination(for: Park.self) { park in
                ParkDetails(park: park)
            }
        }
    }
}

@available(iOS 16.0, *)
#Preview("Overview") {
    NavigationStackContentView()
}

@available(iOS 16.0, *)
struct NavigationStackContentView1: View {
    @State private var presentedParks: [Park] = []
    
    var body: some View {
        NavigationStack(path: $presentedParks) {
            List(Park.parks, id: \.self) { park in
                NavigationLink(park.name, value: park)
            }
            .navigationDestination(for: Park.self) { park in
                ParkDetails(park: park)
            }
        }
        
        Button(showParksTitle) {
            showParks()
        }
    }
    
    var showParksTitle: String {
        let presentedParksDescription: String
        if presentedParks.isEmpty {
            presentedParksDescription = "(N/A)"
        } else {
            let rawDescription = presentedParks.map { park in park.name }.joined(separator: ",")
            presentedParksDescription = "(" + rawDescription + ")"
        }
        
        return "Show parks" + "\n" + presentedParksDescription
    }
    
    func showParks() {
        presentedParks = [
            Park(name: "Yosemite"),
            Park(name: "Sequoia")
        ]
    }
}

@available(iOS 16.0, *)
#Preview("Manage navigation state") {
    NavigationStackContentView1()
}
