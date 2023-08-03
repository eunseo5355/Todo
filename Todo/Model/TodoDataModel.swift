//
//  TodoDataModel.swift
//  Todo
//
//  Created by 배은서 on 2023/08/03.
//

import Foundation

struct Todo {
    var content: String
    var isDone: Bool
}

extension Todo {
    static var todoData = [
        Todo(content: "TIL 쓰기", isDone: false),
        Todo(content: "퇴실 누르기", isDone: true),
        Todo(content: "강아지 약 주기", isDone: false)
    ]
}
