//
//  AppStateView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 4/1/24.
//

import SwiftUI

struct AppStateView: View {
    @StateObject private var viewModel = MangasVM()
    @State private var networkStatus = NetworkStatus()
    @State private var lastState: AppState = .home
    
    var body: some View {
        Group {
            switch viewModel.appState {
            case .splash:
                SplashView()
            case .home:
                MainTabView()
            case .noInternet:
                NoConnectionView()
            }
        }
        .animation(.easeIn, value: viewModel.appState)
        .onChange(of: networkStatus.status) {
            if networkStatus.status == .offline {
                lastState = viewModel.appState
                viewModel.appState = .noInternet
            } else {
                viewModel.appState = lastState
            }
        }
    }
}

#Preview {
    AppStateView()
}
