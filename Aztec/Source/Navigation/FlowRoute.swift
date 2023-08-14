//
//  FlowRoute.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Foundation

enum FlowNavigationStyle {
    case push(FlowRoute)
    case pop
}

enum FlowRoute {
    case home
    case quiz(Quiz)
    case quizList
    case settings
    
    static var defaultRoute: FlowRoute {
        return .home
    }
}

extension FlowRoute: Hashable {
    static func == (lhs: FlowRoute, rhs: FlowRoute) -> Bool {
        switch (lhs, rhs) {
        case (.home, .home), (.quiz, .quiz), (.quizList, .quizList), (.settings, .settings):
            return true
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine(1)
        case .quiz:
            hasher.combine(2)
        case .quizList:
            hasher.combine(3)
        case .settings:
            hasher.combine(4)
        }
    }
}
