//
//  Recette.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import Foundation

typealias Recipes = [Recipe]

struct Recipe {
    var id: UUID = .init()
    var name: String
    var requiredTime: Float
    var note: Int
}

extension Recipe: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}
