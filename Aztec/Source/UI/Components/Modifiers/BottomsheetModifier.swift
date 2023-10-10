//
//  BottomsheetModifier.swift
//  Aztec X
//
//  Created by Matheus Torres on 07/09/23.
//

import SwiftUI

struct BottomsheetModifier: ViewModifier {
    @AppStorage(Constants.AppStorage.darkTheme.rawValue) private var darkTheme: Bool = false
    @Binding var state: Bool
    var innerView: AnyView
    
    @State private var sheetHeight: CGFloat = .zero
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $state) {
                VStack(spacing: 8) {
                    HStack(spacing: 0) {
                        Spacer()
                        Button {
                            state.toggle()
                        } label: {
                            Text(LocalizedStringKey("main.close".localized()))
                                .font(.pressStart(size: 16))
                        }
                        .tint(.primary)
                    }
                    Color.primary.frame(height: 2)
                    innerView
                }
                .padding(.all, 16)
                .overlay {
                    GeometryReader { geometry in
                        Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                    }
                }
                .onPreferenceChange(InnerHeightPreferenceKey.self) {
                    sheetHeight = $0
                }
                .background(colorForEnviroment().ignoresSafeArea(.all))
                .environment(\.colorScheme, enviromentForToggle())
                .presentationDetents([.height(sheetHeight)])
            }
    }
    
    private func colorForEnviroment() -> Color {
        darkTheme ? .black : .white
    }
    
    private func enviromentForToggle() -> ColorScheme {
        darkTheme ? .dark : .light
    }
}

extension View {
    func bottomsheet(state: Binding<Bool>, innerView: AnyView) -> some View {
        modifier(BottomsheetModifier(state: state, innerView: innerView))
    }
}

struct InnerHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
