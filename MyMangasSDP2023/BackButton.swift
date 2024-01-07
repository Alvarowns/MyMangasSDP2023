//
//  BackButton.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 29/12/23.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.purple)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    BackButton()
}
