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

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkButton.setImage(UIImage(named: "checkmark.seal"), for: .normal)
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
    
    func setButtonImage(isChecked: Bool) {
        checkButton.setImage(isChecked ? UIImage(systemName: "checkmark.seal.fill") : UIImage(systemName: "checkmark.seal"), for: .normal)
    }
    
    func setData(todo: Todo) {
        checkButton.setImage(todo.isDone ? UIImage(systemName: "checkmark.seal.fill") : UIImage(systemName: "checkmark.seal"), for: .normal)
        todoLabel.text = todo.content
    }
    
}
