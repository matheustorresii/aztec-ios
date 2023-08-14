//
//  HumanPageView.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct HumanPageView: View {
    @State private var reset: Bool = true
    @State private var start: CGFloat = .zero
    @State private var end: CGFloat = .zero
    
    private struct BloodShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: .init(x: rect.midX, y: rect.minY))
            path.addLine(to: .init(x: rect.maxX - 100, y: rect.midY))
            path.addCurve(
                to: .init(x: rect.midX, y: rect.maxY),
                control1: .init(x: rect.maxX, y: rect.maxY),
                control2: .init(x: rect.midX, y: rect.maxY))
            path.addCurve(
                to: .init(x: rect.minX + 100, y: rect.midY),
                control1: .init(x: rect.midX, y: rect.maxY),
                control2: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(x: rect.midX, y: rect.minY))
            return path
        }
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            buildBlood()
            Image("human")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
        }
    }
    
    @ViewBuilder
    private func buildBlood() -> some View {
        ZStack {
            BloodShape()
                .stroke(style: .init(
                    lineWidth: 2.5,
                    lineCap: .round,
                    lineJoin: .round,
                    miterLimit: 5))
                .foregroundColor(.gray)
                .opacity(0.1)
            BloodShape()
                .trim(from: start, to: end)
                .stroke(style: .init(
                    lineWidth: 5,
                    lineCap: .round,
                    lineJoin: .round,
                    miterLimit: 10))
                .foregroundColor(.red)
                .onAppear(perform: bloodDidAppear)
        }
    }
    
    private func bloodDidAppear() {
        Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { _ in
            if end >= 1, reset {
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                    end = .zero
                    start = .zero
                    reset.toggle()
                }
                reset = false
            }
            withAnimation(.easeOut(duration: 0.5)) {
                end += 0.3
                start = end - 0.3
            }
        }
    }
}

struct HumanPageView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader.init { geometry in
            let rect = geometry.frame(in: .local)
            
            HumanPageView()
                .frame(width: rect.width, height: rect.width)
        }
    }
}
