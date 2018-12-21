//
//  BaseCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Ridho Pratama on 20/12/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    private var childCoordinators: [Coordinator] = []
    
    func start() {
        
    }
    
    func add(childCoordinator: Coordinator) {
        if childCoordinators.index(where: {  $0 === childCoordinator }) == nil {
            childCoordinators.append(childCoordinator)
        }
    }
    
    func remove(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}
