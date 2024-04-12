//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () { }
    
    func register() {
        guard validate() else {
            return
        }
        
        // weak self to avoid memory leak
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userID)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
        // refer to users code in Models to understand dictionary creation
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = ""
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = ""
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = ""
            return false
        }
        
        return true
    }
}
