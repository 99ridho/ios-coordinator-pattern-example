//
//  TodoDetailViewController.swift
//  CoordinatorPatternExample
//
//  Created by Ridho Pratama on 20/12/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

    private let todo: Todo
    public init(todo: Todo) {
        self.todo = todo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = todo.item
        view.backgroundColor = .white
    }
    
}
