//
//  LUListView.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LUListView: View {
    
    private var listLU : [LUItem] = [
        LUItem(
            name: "List 1",
            labelIcon: "😆",
            subItems: [
                LUItem(name: "SL1", labelIcon: "❤️")
            ]
        ),
        LUItem(
            name: "List 2",
            labelIcon: "😎",
            isComplete: true,
            subItems: [
                LUItem(name: "SL1", labelIcon: "❤️‍🔥"),
                LUItem(name: "SL2", labelIcon: "☯️")
            ]
        ),
        LUItem(
            name: "Crazy list 3",
            labelIcon: "🤬",
            subItems: nil
        )
    ]
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(listLU) { item in
                    HStack {
                        Text(item.labelIcon)
                            .rotationEffect(item.isComplete ? .degrees(0) : .degrees(180))
                        Text(item.name)
                            .strikethrough(item.isComplete, color: .red)
                            .foregroundColor(item.isComplete ? .secondary : .primary)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            LUAddView()
                        } label: {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .clipShape(Circle())
                        }.padding(20)
                    }
                }
            }
            .navigationTitle("LineUp")
        }
    }
}

struct LUList_Previews: PreviewProvider {
    static var previews: some View {
        LUListView()
    }
}
