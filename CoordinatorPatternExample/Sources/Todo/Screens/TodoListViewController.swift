//
//  TodoListViewController.swift
//  CoordinatorPatternExample
//
//  Created by Ridho Pratama on 20/12/18.
//  Copyright © 2018 ridhopratama. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "todocell")
        view.estimatedRowHeight = 60
        view.rowHeight = UITableView.automaticDimension
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let addButton = UIBarButtonItem(
        barButtonSystemItem: UIBarButtonItem.SystemItem.add,
        target: nil,
        action: nil
    )
    
    private let todosDummy: [Todo] = [
        Todo(item: "Todo 1", isDone: false),
        Todo(item: "Todo 2", isDone: false),
        Todo(item: "Todo 3", isDone: false),
        Todo(item: "Todo 4", isDone: false),
        Todo(item: "Todo 5", isDone: false),
    ]
    
    public var onAddTodoTapped: (() -> Void)?
    public var onTodoSelected: ((Todo) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Todo List"
        view.backgroundColor = .white
        
        setupTableViewConstraints()
        setupTableView()
        setupAddButton()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupTableViewConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = addButton
        addButton.target = self
        addButton.action = #selector(addButtonTappedAction)
    }
    
    @objc private func addButtonTappedAction() {
        onAddTodoTapped?()
    }
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todocell", for: indexPath)
        cell.textLabel?.text = todosDummy[indexPath.row].item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onTodoSelected?(todosDummy[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
