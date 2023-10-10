//
//  ItemCellView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct ItemCellView: View {
    
    let index: Int
    let label: String
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
                .font(.pressStart(size: 40))
                .multilineTextAlignment(.center)
                .zIndex(2)
                .frame(width: 90)
            Color.primary.frame(width: 2)
            HStack {
                Spacer()
                Text(label)
                    .font(.pressStart(size: 24))
                    .multilineTextAlignment(.center)
                    .zIndex(2)
                Spacer()
            }
        }
        .border(.primary, width: 4)
        .frame(height: 95)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(.background)
    }
}

struct ItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCellView(index: 98,
                     label: "Test Quiz")
    }
}
