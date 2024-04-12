//
//  User.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
}
