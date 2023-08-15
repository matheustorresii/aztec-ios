//
//  Quiz.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

struct Quiz {
    let title: String
    var questions: [Question]
    
    enum All: CaseIterable {
        case sun
        
        var quiz: Quiz {
            switch self {
            case .sun:
                return SunQuiz().quiz
            }
        }
    }
}
        
extension Quiz {
    struct Question {
        let question: String
        let options: [Option]
        let answer: OptionId
        let description: String
        var selected: OptionId?
        
        init(question: String,
             options: [Option],
             answer: OptionId,
             description: String,
             selected: OptionId? = nil) {
            self.question = question
            self.options = options
            self.answer = answer
            self.description = description
            self.selected = selected
        }
    }
}

extension Quiz.Question {
    struct Option {
        let id: OptionId
        let option: String
    }
}

extension Quiz.Question {
    enum OptionId: String {
        case A, B, C, D
        
        var color: Color {
            switch self {
            case .A:
                return .red
            case .B:
                return .green
            case .C:
                return .blue
            case .D:
                return .yellow
            }
        }
    }
}

protocol QuizModelProtocol {
    var quiz: Quiz { get }
}
