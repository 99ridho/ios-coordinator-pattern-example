//
//  AddTodoViewController.swift
//  CoordinatorPatternExample
//
//  Created by Ridho Pratama on 20/12/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    var onTodoAdded: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Todo"
        view.backgroundColor = .white
    }
}
