//
//  HeaderView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String?
    let leftLabel: String?
    let rightLabel: String?
    
    let titleAction: (() -> ())?
    let leftAction: (() -> ())?
    let rightAction: (() -> ())?
    
    init(
        title: String? = nil,
        leftLabel: String? = nil,
        rightLabel: String? = nil,
        titleAction: (() -> ())? = nil,
        leftAction: (() -> ())? = nil,
        rightAction: (() -> ())? = nil) {
            self.title = title
            self.leftLabel = leftLabel
            self.rightLabel = rightLabel
            self.titleAction = titleAction
            self.leftAction = leftAction
            self.rightAction = rightAction
        }
    
    var body: some View {
        VStack {
            HStack {
                buildButton(label: leftLabel, action: leftAction)
                buildTitle()
                Spacer()
                buildButton(label: rightLabel, action: rightAction)
            }
            .padding(.all, 16)
            
            Color.primary.frame(height: 2)
        }
    }
    
    @ViewBuilder
    private func buildTitle() -> some View {
        if let title {
            Spacer()
            if let titleAction {
                buildClickableTitle(title: title, titleAction: titleAction)
            } else {
                Text(title)
                    .font(.pressStart(size: 22))
                    .multilineTextAlignment(.center)
            }
        }
    }
    
    @ViewBuilder
    private func buildClickableTitle(title: String, titleAction: @escaping (() -> ())) -> some View {
        Button {
            titleAction()
        } label: {
            HStack(spacing: 0) {
                Text(title)
                    .font(.pressStart(size: 22))
                Text(">")
                    .font(.pressStart(size: 20))
                    .rotationEffect(.degrees(90))
                    .offset(y: 2)
            }
        }
        .foregroundColor(.primary)
    }
    
    @ViewBuilder
    private func buildButton(label: String?, action: (() -> ())?) -> some View {
        if let label, let action {
            Button {
                action()
            } label: {
                Text(label)
                    .font(.pressStart(size: 28))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
            }
        }
    }
}
