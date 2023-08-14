//
//  Quiz.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import Foundation

struct Quiz {
    let title: String
    let questions: [Question]
}

struct Question {
    let question: String
    let image: String?
    let answers: (String, String, String, String)
    let index: Int
    let description: String
}

let firstQuiz: Quiz = .init(title: "Aztec Gods",
                            questions: [
                              .init(question: "What does the name of Quetzalcoatl, the aztec god of wisdom and life, mean in English?",
                                    image: "serpent",
                                    answers: ("Wise One", "Feathered Serpent", "Aztec Leader", "Strong Horse"),
                                    index: 1,
                                    description: "The name Quetzalcoatl comes from the Nahuatl language and means \"Feathered Serpent\""),
                              .init(question: "Which close ally of Quetzalcoatl is the Aztec god of the rain?",
                                    image: nil,
                                    answers: ("Xolotl", "Meztli", "Tlaloc", "Toci"),
                                    index: 2,
                                    description: "Tlaloc is the god of rain, also a deity of earthly fertility and water."),
                              .init(question: "Which god turned into a jaguar to eat all the giants?",
                                    image: "jaguar",
                                    answers: ("Tezcatlipoca", "Huitzilopochtli", "Xipe Totec", "Quetzalcoatl"),
                                    index: 0,
                                    description: "Tezcatlipoca transformed into a jaguar and joined other jaguars to devour all the giants."),
                              .init(question: "Which god became the moon after a rabbit was thrown at him?",
                                    image: "moon-rabbit",
                                    answers: ("Chalchiuhtlicue", "Tezcatlipoca", "Quetzalcoatl", "Tecciztecatl"),
                                    index: 3,
                                    description: "Concerned about the second sun, the other gods threw a rabbit at Tecciztecatl, turning him into the Moon.")
                            ])

var quizzes: [Quiz] = .init(repeating: firstQuiz, count: 99)