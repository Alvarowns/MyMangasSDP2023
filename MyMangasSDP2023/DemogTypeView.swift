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
                Color.red.opacity(0.5)
            case .shoujo:
                Color.pink.opacity(0.5)
            case .seinen:
                Color.green.opacity(0.5)
            case .kids:
                Color.blue.opacity(0.5)
            case .josei:
                Color.orange.opacity(0.5)
            }
        }
        Text(demographic.rawValue)
            .font(.custom("LeagueSpartan-SemiBold", size: 20))
            .textCase(.uppercase)
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(color.opacity(0.5))
            }
    }
}


#Preview {
    DemogTypeView(demographic: .seinen)
}
