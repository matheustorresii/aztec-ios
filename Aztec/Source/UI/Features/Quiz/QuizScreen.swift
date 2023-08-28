//
//  QuizScreen.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

struct QuizScreen: View, NavigableView {
    @State private var progress: Int = 0
    @State private var didSelect: Bool = false
    @State private var showingBottomsheet: Bool = false
    @State private var bottomsheetSize: CGFloat = .zero
    @State var quiz: Quiz
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 16),
        .init(.flexible(), spacing: 16)
    ]
    
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> = .init()
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: quiz.title,
                       leftLabel: "<",
                       leftAction: {
                navigation.send(.pop)
            })
            
            if let question = quiz.questions[safe: progress] {
                buildQuizView(question) { selectedOption in
                    quiz.questions[progress].selected = selectedOption
                    progress += 1
                }
                .padding(.top, 16)
            } else {
                QuizResultView(quiz: quiz)
            }
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private func buildQuizView(_ question: Quiz.Question,
                               didTapOption: ((Quiz.Question.OptionId) -> Void)?) -> some View {
        VStack {
            buildProgressView()
            
            Spacer()
                .frame(height: 16)
            
            Text(question.question)
                .font(.pressStart(size: 22))
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(question.options, id: \.id) { option in
                    buildOptionView(option: option)
                        .onTapGesture {
                            didTapOption?(option.id)
                        }
                }
            }
            
            Spacer()
                .frame(height: 16)
        }
    }
    
    @ViewBuilder
    private func buildProgressView() -> some View {
        HStack(spacing: 0) {
            ForEach(quiz.questions, id: \.question) { question in
                if let selected = question.selected {
                    if selected == question.answer {
                        Color.green
                    } else {
                        Color.red
                    }
                } else {
                    Color.black
                }
            }
        }
        .frame(height: 4)
    }
    
    @ViewBuilder
    private func buildOptionView(option: Quiz.Question.Option) -> some View {
        VStack {
            Spacer()
            Text(option.id.rawValue)
                .font(.pressStart(size: 40))
                .foregroundColor(option.id.color)
            Spacer()
            Text(option.option)
                .font(.pressStart(size: 16))
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .aspectRatio(1.25, contentMode: .fit)
        .padding(8)
        .border(option.id.color, width: 4)
        .background {
            Rectangle()
                .fill(.background)
        }
        .background {
            Rectangle()
                .fill(option.id.color)
                .offset(.init(width: -4, height: 4))
        }
    }
}

struct QuizScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuizScreen(quiz: SunQuiz().quiz)
    }
}
