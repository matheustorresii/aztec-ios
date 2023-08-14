//
//  HerdPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct HerdPageView: View {
    
    @State var paged = false
    
    let timer = Timer.publish(every: 0.75, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            if !paged {
                createSquaredHerd()
            }
            
            if paged {
                createSquaredHerd()
            }
        }
        .onReceive(timer) { startDate in
            withAnimation {
                paged.toggle()
            }
        }
    }
    
    @ViewBuilder
    private func createSquaredHerd() -> some View {
        VStack {
            HStack {
                createHerdImage()
                createHerdImage()
            }
            HStack {
                createHerdImage()
                createHerdImage()
            }
        }
        .transition(.asymmetric(
            insertion: .move(edge: .leading),
            removal: .move(edge: .trailing)))
    }
    
    @ViewBuilder
    private func createHerdImage() -> some View {
        Image("herd-\(Int.random(in: 1...4))")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(10)
    }
}

struct HerdPageView_Previews: PreviewProvider {
    static var previews: some View {
        HerdPageView()
    }
}
