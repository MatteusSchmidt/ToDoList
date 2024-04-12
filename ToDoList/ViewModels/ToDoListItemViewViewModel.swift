//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        // using the inverse to set it to true if false and vice versa
        // create a copy because item is a constant
        itemCopy.setDone(!item.isDone)
        
        // update record for item
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
