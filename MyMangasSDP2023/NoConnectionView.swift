//
//  NoConnectionView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 4/1/24.
//

import SwiftUI

struct NoConnectionView: View {
    var body: some View {
        ContentUnavailableView("No Internet",
                               systemImage: "wifi.exclamationmark",
                               description: Text("This app must have internet connection to work."))
    }
}

#Preview {
    NoConnectionView()
}
