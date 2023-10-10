//
//  SettingsCellView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct SettingsCellView: View {
    let id: String
    let text: String
    let initialState: Bool
    let didTapSwitchWithId: ((String) -> Void)?
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(text))
                .font(.pressStart(size: 16))
                .padding(.horizontal, 16)
                .zIndex(2)
            
            Spacer()
            
            SwitchView(id: id, state: initialState) { id in
                didTapSwitchWithId?(id)
            }
            .frame(width: 100)
        }
    }
}

struct SettingsCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SettingsCellView(id: "AUTO_SPEECH", text: "Auto Speech", initialState: false) { _ in }
            SettingsCellView(id: "DARK_THEME", text: "Dark Theme", initialState: true) { _ in }
        }
    }
}
