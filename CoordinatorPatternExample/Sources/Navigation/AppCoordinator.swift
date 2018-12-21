//
//  AppCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Ridho Pratama on 20/12/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    private var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    override func start() {
        startTodo()
    }
    
    private func startTodo() {
        let todoCoordinator = TodoCoordinator(navigationController: self.navigationController)
        
        todoCoordinator.onFinishFlow = { [weak self, weak todoCoordinator] in
            guard let theTodoCoordinator = todoCoordinator else { return }
            
            self?.remove(childCoordinator: theTodoCoordinator)
        }
        
        add(childCoordinator: todoCoordinator)
        todoCoordinator.start()
    }
}
