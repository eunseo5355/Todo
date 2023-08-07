//
//  EditViewController.swift
//  Todo
//
//  Created by 배은서 on 2023/08/07.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    
    var touchedEditButton: (() -> ())?
    var touchedDeleteButton: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpEditButton(_ sender: Any) {
        touchedEditButton?()
    }
    
    @IBAction func touchUpDeleteButton(_ sender: Any) {
        touchedDeleteButton?()
    }
    
    func setTitle(todo: String) {
        todoLabel.text = todo
    }
    
}
