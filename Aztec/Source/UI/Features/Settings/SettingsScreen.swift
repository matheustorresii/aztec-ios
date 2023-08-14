//
//  SettingsScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import Combine
import SwiftUI

struct SettingsScreen: View, NavigableView {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    @AppStorage(Constants.AppStorage.darkTheme.rawValue) private var darkTheme: Bool = false
    @AppStorage(Constants.AppStorage.autoSpeech.rawValue) private var autoSpeech: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "title.quiz".localized(), leftLabel: "<", leftAction: {
                navigation.send(.pop)
            })
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    Spacer().frame(height: 16)
                    SettingsCellView(id: Constants.AppStorage.darkTheme.rawValue,
                                     text: "settings.darkTheme".localized(),
                                     initialState: darkTheme,
                                     didTapSwitchWithId: didTapSwitchWith(id:))
                    SettingsCellView(id: Constants.AppStorage.autoSpeech.rawValue,
                                     text: "settings.autoSpeech".localized(),
                                     initialState: autoSpeech,
                                     didTapSwitchWithId: didTapSwitchWith(id:))
                }
                .padding(.horizontal, 16)
            }
        }
    }
    
    private func didTapSwitchWith(id: String) {
        guard let appStorage = Constants.AppStorage(rawValue: id) else { return }
        switch appStorage {
        case .darkTheme:
            darkTheme.toggle()
        case .autoSpeech:
            autoSpeech.toggle()
        }
    }
}
