//
//  MainViewController.swift
//  Todo
//
//  Created by 배은서 on 2023/07/31.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var selectedDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpStartButton(_ sender: Any) {
        guard let todoViewController = storyboard?.instantiateViewController(withIdentifier: "TodoViewController") as? TodoViewController else { return }
        todoViewController.todoDate = selectedDate
        navigationController?.pushViewController(todoViewController, animated: true)
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        selectedDate = datePicker.date
    }
    
}

