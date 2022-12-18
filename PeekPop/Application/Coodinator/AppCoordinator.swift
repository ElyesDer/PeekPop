//
//  AppCoordinator.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import UIKit

class AppCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("AppCoordinator Start")
        goToHome()
    }
    
    func goToHome(){
        // Initiate HomeTabBar Coordinator
        let coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        children.append(coordinator)
        
        coordinator.start()
    }
    
    deinit {
        print("AppCoordinator Deinit")
    }
    
    
}
