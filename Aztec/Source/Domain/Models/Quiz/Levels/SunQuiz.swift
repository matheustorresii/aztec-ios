//
//  SunQuiz.swift
//  Aztec
//
//  Created by Matheus Torres on 15/08/23.
//

import Foundation

struct SunQuiz: QuizModelProtocol {
    var quiz: Quiz {
        .init(title: "Five Suns",
              questions: [
                // MARK: - 1
                .init(question: "Who was the First Sun?",
                      options: [
                        .init(id: .A, option: "Tezcatlipoca"),
                        .init(id: .B, option: "Quetzalcoatl"),
                        .init(id: .C, option: "Tlaloc"),
                        .init(id: .D, option: "Xipe Totec"),
                      ],
                      answer: .A,
                      description: "Tezcatlipoca was the First Sun, also known as the Jaguar Sun."),
                // MARK: - 2
                .init(question: "Who was the Second Sun?",
                      options: [
                        .init(id: .A, option: "Xipe Totec"),
                        .init(id: .B, option: "Tlaloc"),
                        .init(id: .C, option: "Quetzalcoatl"),
                        .init(id: .D, option: "Huitzilopochtli"),
                      ],
                      answer: .C,
                      description: "Quetzalcoatl was the Second Sun, also known as the Wind Sun."),
                // MARK: - 3
                .init(question: "Who was the Third Sun?",
                      options: [
                        .init(id: .A, option: "Tlaloc"),
                        .init(id: .B, option: "Tezcatlipoca"),
                        .init(id: .C, option: "Xipe Totec"),
                        .init(id: .D, option: "Ometeotl"),
                      ],
                      answer: .A,
                      description: "Tlaloc was the Third Sun, also known as the Rain Sun."),
                // MARK: - 4
                .init(question: "Who was the Fourth Sun?",
                      options: [
                        .init(id: .A, option: "Chalchiuhtlicue"),
                        .init(id: .B, option: "Ometeotl"),
                        .init(id: .C, option: "Xipe Totec"),
                        .init(id: .D, option: "Huitzilopochtli"),
                      ],
                      answer: .A,
                      description: "Chalchiuhtlicue was the Fourth Sun, also known as the Water Sun."),
                // MARK: - 5
                .init(question: "Who is the Fifth Sun?",
                      options: [
                        .init(id: .A, option: "Ometeotl"),
                        .init(id: .B, option: "Huitzilopochtli"),
                        .init(id: .C, option: "Xipe Totec"),
                        .init(id: .D, option: "Tonatiuh"),
                      ],
                      answer: .D,
                      description: "Tonatiuh is the Fifth Sun, according to prophecy, it will end with a great earthquake."),
              ])
    }
}
