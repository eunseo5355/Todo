//
//  TodoViewController.swift
//  Todo
//
//  Created by 배은서 on 2023/08/01.
//

import UIKit

class TodoViewController: UIViewController {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var todoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setTableView()
        setDate()
    }
    
    @IBAction func touchUpEditButton(_ sender: Any) {
        
    }
    
    @IBAction func touchUpAddButton(_ sender: Any) {
        let alert = UIAlertController(title: "할 일 추가하기", message: nil, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        let addButton = UIAlertAction(title: "추가", style: .default) { _ in
            let todo = Todo(content: alert.textFields?[0].text ?? "", isDone: false)
            Todo.todoData.append(todo)
            Todo.todoData.sort { !$0.isDone && $1.isDone }
            self.todoTableView.reloadData()
        }
        
        alert.addTextField()
        
        alert.addAction(cancelButton)
        alert.addAction(addButton)
        
        present(alert, animated: true)
    }
    
    func setDate() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        dayLabel.text = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "MMM"
        monthLabel.text = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "yyyy"
        yearLabel.text = dateFormatter.string(from: date)
    }
    
    func setTableView() {
        let nib = UINib(nibName: TodoTableViewCell.identifier, bundle: nil)
        todoTableView.register(nib, forCellReuseIdentifier: TodoTableViewCell.identifier)
        
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
        Todo.todoData.sort { !$0.isDone && $1.isDone }
    }
    

}

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Todo.todoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = todoTableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as? TodoTableViewCell
        else { return UITableViewCell() }
        
        cell.setData(todo: Todo.todoData[indexPath.row])
        cell.touchedCheckButton = {
            Todo.todoData[indexPath.row].isDone.toggle()
            cell.setButtonImage(isChecked: Todo.todoData[indexPath.row].isDone)
            Todo.todoData.sort { !$0.isDone && $1.isDone }
            self.todoTableView.reloadData()
        }
        
        return cell
    }
}

extension TodoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
