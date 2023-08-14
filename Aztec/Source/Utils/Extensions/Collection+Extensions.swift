//
//  Collection+Extensions.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
