//
//  SunQuiz.swift
//  Aztec
//
//  Created by Matheus Torres on 15/08/23.
//

import Foundation

struct SunQuiz: QuizModelProtocol {
    var quiz: Quiz {
        .init(title: "quiz.sun.title".localized(),
              questions: [
                // MARK: - 1
                .init(question: "quiz.sun.1.question".localized(),
                      options: [
                        .init(id: .A, option: "quiz.sun.1.A".localized()),
                        .init(id: .B, option: "quiz.sun.1.B".localized()),
                        .init(id: .C, option: "quiz.sun.1.C".localized()),
                        .init(id: .D, option: "quiz.sun.1.D".localized()),
                      ],
                      answer: .A,
                      description: "quiz.sun.1.description".localized()),
                // MARK: - 2
                .init(question: "quiz.sun.2.question".localized(),
                      options: [
                        .init(id: .A, option: "quiz.sun.2.A".localized()),
                        .init(id: .B, option: "quiz.sun.2.B".localized()),
                        .init(id: .C, option: "quiz.sun.2.C".localized()),
                        .init(id: .D, option: "quiz.sun.2.D".localized()),
                      ],
                      answer: .C,
                      description: "quiz.sun.2.description".localized()),
                // MARK: - 3
                .init(question: "quiz.sun.3.question".localized(),
                      options: [
                        .init(id: .A, option: "quiz.sun.3.A".localized()),
                        .init(id: .B, option: "quiz.sun.3.B".localized()),
                        .init(id: .C, option: "quiz.sun.3.C".localized()),
                        .init(id: .D, option: "quiz.sun.3.D".localized()),
                      ],
                      answer: .A,
                      description: "quiz.sun.3.description".localized()),
                // MARK: - 4
                .init(question: "quiz.sun.4.question".localized(),
                      options: [
                        .init(id: .A, option: "quiz.sun.4.A".localized()),
                        .init(id: .B, option: "quiz.sun.4.B".localized()),
                        .init(id: .C, option: "quiz.sun.4.C".localized()),
                        .init(id: .D, option: "quiz.sun.4.D".localized()),
                      ],
                      answer: .A,
                      description: "quiz.sun.4.description".localized()),
                // MARK: - 5
                .init(question: "quiz.sun.5.question".localized(),
                      options: [
                        .init(id: .A, option: "quiz.sun.1.A".localized()),
                        .init(id: .B, option: "quiz.sun.2.B".localized()),
                        .init(id: .C, option: "quiz.sun.3.C".localized()),
                        .init(id: .D, option: "quiz.sun.4.D".localized()),
                      ],
                      answer: .D,
                      description: "quiz.sun.5.description".localized()),
              ])
    }
}
