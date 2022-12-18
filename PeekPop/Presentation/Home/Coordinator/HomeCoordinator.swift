//
//  HomeCoordinator.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import UIKit
import Inject

class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("Coordinator Start")
        goHomePage()
    }
    
    func goHomePage(){
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        
        let vc = Inject.ViewControllerHost(HomeViewController(viewModel: homeViewModel))
        navigationController.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("AppCoordinator Deinit")
    }
}
