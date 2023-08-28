//
//  ChapterSelectorView.swift
//  Aztec X
//
//  Created by Matheus Torres on 27/08/23.
//

import SwiftUI

struct ChapterSelectorView: View {
    @Binding var shouldShowChapterSelector: Bool
    @Binding var page: PageProtocol
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(Array(Chapter.allCases.enumerated()), id: \.offset) { (index, chapter) in
                        Button {
                            self.page = chapter.page
                            shouldShowChapterSelector.toggle()
                        } label: {
                            ItemCellView(index: index, label: chapter.title)
                        }
                        .tint(.primary)
                    }
                }
            }
            .onTapGesture {
                shouldShowChapterSelector.toggle()
            }
        }
    }
}

struct ChapterSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterSelectorView(
            shouldShowChapterSelector: .init(get: { true }, set: { _ in }),
            page: .init(get: { SunPages.start }, set: { _ in })
        )
    }
}
