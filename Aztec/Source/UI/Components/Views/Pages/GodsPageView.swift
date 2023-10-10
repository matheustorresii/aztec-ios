//
//  GodsPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import SwiftUI

struct GodsPageView: View {
    @State private var rotation: Double = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                createImage(named: "serpent", padding: 10)
                    .rotationEffect(.degrees(-rotation))
                createImage(named: "jaguar", padding: 10)
                    .rotationEffect(.degrees(-rotation))
            }
            HStack(spacing: 0) {
                createImage(named: "hummingbird", padding: 10)
                    .rotationEffect(.degrees(-rotation))
                createImage(named: "quail", padding: 25)
                    .rotationEffect(.degrees(-rotation))
            }
        }
        .padding(.horizontal, 16)
        .rotationEffect(.degrees(rotation))
        .onAppear {
            withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
    
    @ViewBuilder
    private func createImage(named name: String, padding: CGFloat) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(padding)
            .actionImage(innerView: createImageInnerView(name).toAny())
    }
    
    @ViewBuilder
    private func createImageInnerView(_ image: String) -> some View {
        Text(getTextForImage(image).localized())
            .font(.pressStart(size: 20))
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private func getTextForImage(_ image: String) -> String {
        switch image {
        case "serpent":
            return "pages.gods.quetzalcoatl"
        case "jaguar":
            return "pages.gods.tezcatlipoca"
        case "hummingbird":
            return "pages.gods.huitzilopochtli"
        case "quail":
            return "pages.gods.xipetotec"
        default:
            return .empty
        }
    }
}

struct GodsPageView_Previews: PreviewProvider {
    static var previews: some View {
        GodsPageView()
    }
}
