//
//  SplashView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 4/1/24.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = MangasVM()
    
    @State var loading: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("mangashelf")
                .mainTitle(size: 50)
                .foregroundStyle(.purple)
            
            ProgressView()
                .controlSize(.extraLarge)
                .opacity(loading ? 1.0 : 0.0)
        }
        .task {
            try? await Task.sleep(for: .seconds(2))
            loading = true
            try? await Task.sleep(for: .seconds(2))
            await viewModel.getMangas()
            loading = false
            viewModel.appState = .home
        }
    }
}

#Preview {
    SplashView()
}
