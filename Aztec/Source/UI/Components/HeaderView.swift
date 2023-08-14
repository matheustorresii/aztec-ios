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
    
    let leftAction: (() -> ())?
    let rightAction: (() -> ())?
    
    init(
        title: String? = nil,
        leftLabel: String? = nil,
        rightLabel: String? = nil,
        leftAction: (() -> ())? = nil,
        rightAction: (() -> ())? = nil) {
            self.title = title
            self.leftLabel = leftLabel
            self.rightLabel = rightLabel
            self.leftAction = leftAction
            self.rightAction = rightAction
        }
    
    var body: some View {
        HStack {
            if let leftLabel, let leftAction {
                Button {
                    leftAction()
                } label: {
                    Text(leftLabel)
                        .font(.pressStart(size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
            }
            if let title {
                Spacer()
                Text(title)
                    .font(.pressStart(size: 20))
                    .multilineTextAlignment(.center)
            }
            Spacer()
            if let rightLabel, let rightAction {
                Button {
                    rightAction()
                } label: {
                    Text(rightLabel)
                        .font(.pressStart(size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}
