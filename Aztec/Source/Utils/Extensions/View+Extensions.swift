//
//  View+Extensions.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import SwiftUI

extension View {
    func toAny() -> AnyView {
        .init(self)
    }
}
