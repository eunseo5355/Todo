//
//  MainViewController.swift
//  Todo
//
//  Created by 배은서 on 2023/07/31.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpStartButton(_ sender: Any) {
        guard let todoViewController = storyboard?.instantiateViewController(withIdentifier: "TodoViewController") else { return }
        navigationController?.pushViewController(todoViewController, animated: true)
    }
    
}

