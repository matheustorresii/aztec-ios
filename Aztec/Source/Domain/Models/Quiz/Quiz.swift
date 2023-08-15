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

struct Question {
    let question: String
    let image: String?
    let answers: (String, String, String, String)
    let index: Int
    let description: String
}
