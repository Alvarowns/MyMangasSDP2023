//
//  DemogTypeView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 28/12/23.
//

import SwiftUI

struct DemogTypeView: View {
    let demographic: DemographicName
    
    var body: some View {
        var color: Color {
            switch demographic {
            case .shounen:
                Color.red
            case .shoujo:
                Color.pink
            case .seinen:
                Color.green
            case .kids:
                Color.blue
            case .josei:
                Color.yellow
            }
        }
        Text(demographic.rawValue)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(color).colorMultiply(color)
            .textInputAutocapitalization(.words)
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(color.opacity(0.2))
            }
    }
}


#Preview {
    DemogTypeView(demographic: .josei)
}
