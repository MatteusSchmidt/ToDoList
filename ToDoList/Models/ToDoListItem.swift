//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    // mutating value of a function because struct is a value type
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
