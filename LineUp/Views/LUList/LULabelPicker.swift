//
//  LULabelPicker.swift
//  LineUp
//
//  Created by Steven Wijaya on 24.02.2023.
//

import SwiftUI

struct LULabelPicker: View {
    @Binding var selectedEmoji: String
    @Environment(\.dismiss) var dismiss
    
    let columns = [
            GridItem(.adaptive(minimum: 80))
        ]
    
    private let labelIcons: [String] = ["😁", "😆", "😇", "😂", "😅", "😎", "🤓", "🥳", "🥹", "🤬", "🤯", "🤠", "🫶", "🫁", "🫀", "🧠"]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(labelIcons, id: \.self) { icon in
                RoundedRectangle(cornerRadius: 10)
                    .fill((selectedEmoji == icon ? Color.brandPrimary : Color.brandSecondary).opacity(0.7))
                    .frame(width: 50, height: 50)
                    .overlay {
                        Text(icon)
                    }
                    .onTapGesture {
                        selectedEmoji = icon
                        dismiss()
                    }
            }
        }
    }
}

struct LULabelPicker_Previews: PreviewProvider {
    static var previews: some View {
        LULabelPicker(selectedEmoji: .constant("😁"))
    }
}
