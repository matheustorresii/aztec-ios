//
//  Chapter.swift
//  Aztec
//
//  Created by Matheus Torres on 20/08/23.
//

import Foundation

enum Chapter: CaseIterable {
    case sun
    
    var title: String {
        switch self {
        case .sun:
            return "chapter.sun.title".localized()
        }
    }
    
    var page: PageProtocol {
        switch self {
        case .sun:
            return SunPages.start
        }
    }
    
    var quiz: [Quiz] {
        switch self {
        case .sun:
            return [SunQuiz().quiz, FourGodsQuiz().quiz]
        }
    }
}
