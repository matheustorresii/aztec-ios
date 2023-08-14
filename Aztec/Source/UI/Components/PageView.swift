//
//  PageView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct PageView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Texto muito grande aqui sério que texto grande eu acho que não consigo dizer como esse texto é grande")
                .font(.pressStart(size: 14))
            
            Rectangle()
                .fill(.red)
                .aspectRatio(1, contentMode: .fit)
            
            Text("Esse texto não é tão grande assim")
        }
    }
}
