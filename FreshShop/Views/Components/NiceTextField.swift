//
//  NiceTextField.swift
//  FreshShop
//
//  Created by Mateo Andres Perano on 06/05/2025.
//

import SwiftUI

struct NiceTextField: View {
    // MARK: - PROPERTIES
    var titleLabel: String
    @Binding var fieldValue: String
    @FocusState private var isFocused: Bool
    @State private var isActive: Bool = false
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(titleLabel)
                .font(.caption2)
                .foregroundStyle(.gray)
            
            TextField("", text: $fieldValue)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .contentShape(.rect)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isActive ? .buttonsDarkGreen : .gray.opacity(0.5), lineWidth: 1.5)
                )
                .focused($isFocused)
                .onChange(of: isFocused, {
                    withAnimation(.default){
                        isActive.toggle()
                    }
                })
        })
    }
}

#Preview {
    NiceTextField(titleLabel: "Street", fieldValue: .constant(""))
    
}
