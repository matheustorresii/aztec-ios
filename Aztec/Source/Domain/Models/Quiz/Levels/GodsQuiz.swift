//
//  GodsQuiz.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import Foundation

struct GodsQuiz {
    var quiz: Quiz {
        let questions: [Quiz.Question] = [
            .init(question: "What does the name of Quetzalcoatl, the aztec god of wisdom and life, mean in English?",
                  options: [
                    .init(id: .A, option: "Wise One"),
                    .init(id: .B, option: "Feathered Serpent"),
                    .init(id: .C, option: "Aztec Leader"),
                    .init(id: .D, option: "Strong Horse")
                  ],
                  answer: .B,
                  description: "The name Quetzalcoatl comes from the Nahuatl language and means \"Feathered Serpent\""),
            
            .init(question: "Which close ally of Quetzalcoatl is the Aztec god of the rain?",
                  options: [
                    .init(id: .A, option: "Xolotl"),
                    .init(id: .B, option: "Meztli"),
                    .init(id: .C, option: "Tlaloc"),
                    .init(id: .D, option: "Toci")
                  ],
                  answer: .C,
                  description: "Tlaloc is the god of rain, also a deity of earthly fertility and water."),
            
            .init(question: "Which god turned into a jaguar to eat all the giants?",
                  options: [
                    .init(id: .A, option: "Tezcatlipoca"),
                    .init(id: .B, option: "Huitzilopochtli"),
                    .init(id: .C, option: "Xipe Totec"),
                    .init(id: .D, option: "Quetzalcoatl"),
                  ],
                  answer: .A,
                  description: "Tezcatlipoca transformed into a jaguar and joined other jaguars to devour all the giants."),
            
            .init(question: "Which god became the moon after a rabbit was thrown at him?",
                  options: [
                    .init(id: .A, option: "Chalchiuhtlicue"),
                    .init(id: .B, option: "Tezcatlipoca"),
                    .init(id: .C, option: "Quetzalcoatl"),
                    .init(id: .D, option: "Tecciztecatl")
                  ],
                  answer: .D,
                  description: "Concerned about the second sun, the other gods threw a rabbit at Tecciztecatl, turning him into the Moon.")
        ]
        
        return .init(title: "Gods",
                     questions: questions)
    }
}
