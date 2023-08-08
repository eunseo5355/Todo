//
//  TodoTableViewCell.swift
//  Todo
//
//  Created by 배은서 on 2023/08/01.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    static let identifier = "TodoTableViewCell"
    var touchedCheckButton: (() -> ())?
    var touchedMoreButton: ((_ todo: String) -> ())?
    var didEndEditing: ((_ todo: String) -> ())?

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var todoTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTextField()
        contentView.layer.cornerRadius = 22
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func touchUpCheckButton(_ sender: Any) {
        touchedCheckButton?()
    }
    
    @IBAction func touchUpMoreButton(_ sender: Any) {
        touchedMoreButton?(todoTextField.text ?? "")
    }
    
    func setTextField() {
        todoTextField.delegate = self
        todoTextField.isEnabled = false
    }
    
    func setButtonImage(isChecked: Bool) {
        checkButton.setImage(isChecked ? UIImage(systemName: "checkmark.seal.fill") : UIImage(systemName: "checkmark.seal"), for: .normal)
    }
    
    func editTextField() {
        todoTextField.isEnabled = true
        todoTextField.becomeFirstResponder()
    }
    
    func setData(todo: Todo) {
        checkButton.setImage(todo.isDone ? UIImage(systemName: "checkmark.seal.fill") : UIImage(systemName: "checkmark.seal"), for: .normal)
        todoTextField.text = todo.content
    }
    
}

//MARK: - UITextFieldDelegate

extension TodoTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didEndEditing?(todoTextField.text ?? "")
        todoTextField.resignFirstResponder()
        return true
    }
}
