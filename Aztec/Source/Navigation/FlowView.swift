//
//  FlowView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct FlowView: View {
    @AppStorage(Constants.AppStorage.darkTheme.rawValue) private var darkTheme: Bool = false
    @StateObject private var appCoordinator = AppCoordinator(path: .init())
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(route: .defaultRoute)
                .navigationDestination(for: FlowRoute.self) { route in
                    appCoordinator.build(route: route)
                        .navigationBarBackButtonHidden(true)
                }
        }
        .environmentObject(appCoordinator)
        .environment(\.colorScheme, enviromentForToggle())
    }
    
    private func enviromentForToggle() -> ColorScheme {
        darkTheme ? .dark : .light
    }
}
