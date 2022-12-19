//
//  HomeViewModel.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import Foundation
import UIKit

class HomeViewModel {
    var coordinator: HomeCoordinator!
    
    @Published
    var recipes: Recipes = []
    
    let sorter: ArraySorter = .init()
    
    func randomAddRecipe() {
        let recipe: Recipe = Mocks.generate()
        
        var _recipes: Recipes = recipes
        _recipes.append(recipe)
        let mutableItems = NSMutableArray(array: _recipes)
        let mutableArray = sorter.sortRecipes(mutableItems)
        
        self.recipes = mutableArray as? NSArray as! Recipes
    }
    
    func previewDetails(index: Int) -> UIViewController {
        let recipe = recipes[index]
        return coordinator.buildDetailsViewController(with: recipe)
    }
    
    func pushDetailsViewController(vc: UIViewController) {
        self.coordinator.redirectDetailsPage(vc: vc)
    }
    
    func didSelectItemAt(index: Int) {
        self.coordinator.redirectDetailsPage(vc: previewDetails(index: index))
    }
}
