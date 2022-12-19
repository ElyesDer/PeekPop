//
//  Recette.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import Foundation

typealias Recipes = [Recipe]

@objc(Recipe)
class Recipe: NSObject {
    
    var id: UUID = .init()
    
    @objc
    var name: String
    
    @objc
    var requiredTime: Int
    
    @objc
    var note: Int
    
    var ingredient: String
    var preparation: String
    var imageName: String
    
    internal init(id: UUID = .init(), name: String, requiredTime: Int, note: Int, ingredient: String, preparation: String, imageName: String) {
        self.id = id
        self.name = name
        self.requiredTime = requiredTime
        self.note = note
        self.ingredient = ingredient
        self.preparation = preparation
        self.imageName = imageName
    }
}

extension Recipe {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.id == rhs.id
    }
}
