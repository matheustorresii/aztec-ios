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
        case gods
        
        var quiz: Quiz {
            switch self {
            case .gods:
                return GodsQuiz().quiz
            }
        }
    }
}
        
extension Quiz {
    struct Question {
        let id: String
        let question: String
        let options: [Option]
        let answer: OptionId
        let description: String
        var success: Bool?
        
        init(id: String,
             question: String,
             options: [Option],
             answer: OptionId,
             description: String,
             success: Bool? = nil) {
            self.id = id
            self.question = question
            self.options = options
            self.answer = answer
            self.description = description
            self.success = success
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
