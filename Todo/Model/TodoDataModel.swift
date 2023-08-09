//
//  TodoDataModel.swift
//  Todo
//
//  Created by 배은서 on 2023/08/03.
//

import Foundation

struct Todo: Codable {
    var content: String
    var isDone: Bool
}
