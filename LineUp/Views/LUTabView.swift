//
//  LUTabView.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LUTabView: View {
    var body: some View {
        TabView {
            LUListView()
                .tabItem {
                    Label("LineUp", systemImage: "list.bullet.clipboard")
                }
            Text("Hello, Calendar!")
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            Text("Hello, Profile!")
                .tabItem {
                    Label("Profile", systemImage: "person.text.rectangle")
                }
        }
        .accentColor(.brandPrimary)
    }
}

struct LUTabView_Previews: PreviewProvider {
    static var previews: some View {
        LUTabView()
    }
}
