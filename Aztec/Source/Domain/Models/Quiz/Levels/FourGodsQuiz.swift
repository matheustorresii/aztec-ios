//
//  FourGodsQuiz.swift
//  Aztec X
//
//  Created by Matheus Torres on 10/10/23.
//

import Foundation

struct FourGodsQuiz: QuizProtocol {
    var quiz: Quiz {
        .init(title: "Four Gods",
              questions: [
                .init(question: "quiz.four.gods.1.question".localized(),
                      options: [
                        .init(id: .A, option: "quiz.four.gods.feathered.serpent".localized()),
                        .init(id: .B, option: "quiz.four.gods.hummingbird".localized()),
                        .init(id: .C, option: "quiz.four.gods.quail".localized()),
                        .init(id: .D, option: "quiz.four.gods.dragon".localized())
                      ],
                      answer: .A,
                      description: "pages.gods.quetzalcoatl".localized()),
                
                    .init(question: "quiz.four.gods.2.question".localized(),
                          options: [
                            .init(id: .A, option: "quiz.four.gods.jaguar".localized()),
                            .init(id: .B, option: "quiz.four.gods.cat".localized()),
                            .init(id: .C, option: "quiz.four.gods.feathered.serpent".localized()),
                            .init(id: .D, option: "quiz.four.gods.bee".localized())
                          ],
                          answer: .A,
                          description: "pages.gods.tezcatlipoca".localized()),
                
                    .init(question: "quiz.four.gods.3.question".localized(),
                          options: [
                            .init(id: .A, option: "quiz.four.gods.feathered.serpent".localized()),
                            .init(id: .B, option: "quiz.four.gods.hummingbird".localized()),
                            .init(id: .C, option: "quiz.four.gods.quail".localized()),
                            .init(id: .D, option: "quiz.four.gods.dragon".localized())
                          ],
                          answer: .C,
                          description: "pages.gods.xipetotec".localized()),
                
                    .init(question: "quiz.four.gods.4.question".localized(),
                          options: [
                            .init(id: .A, option: "quiz.four.gods.bee".localized()),
                            .init(id: .B, option: "quiz.four.gods.hummingbird".localized()),
                            .init(id: .C, option: "quiz.four.gods.cat".localized()),
                            .init(id: .D, option: "quiz.four.gods.dragon".localized())
                          ],
                          answer: .B,
                          description: "pages.gods.huitzilopochtli".localized()),
              ])
    }
}
