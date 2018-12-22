//
//  TodoCoordinator.swift
//  CoordinatorPatternExample
//
//  Created by Ridho Pratama on 20/12/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import Foundation
import UIKit

class TodoCoordinator: BaseCoordinator {
    private var navigationController: UINavigationController?
    
    public var onFinishFlow: (() -> Void)?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    override func start() {
        showTodoListScreen()
    }
    
    private func showTodoListScreen() {
        let controller = TodoListViewController()
        
        controller.onAddTodoTapped = { [weak self] in
            self?.showAddTodoScreen()
        }
        
        controller.onTodoSelected = { [weak self] todo in
            self?.showTodoDetailScreen(withTodo: todo)
        }
        
        navigationController?.setViewControllers([controller], animated: true)
    }
    
    private func showAddTodoScreen() {
        let controller = AddTodoViewController()
        
        controller.onTodoAdded = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showTodoDetailScreen(withTodo todo: Todo) {
        let controller = TodoDetailViewController(todo: todo)
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
