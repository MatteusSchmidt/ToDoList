//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // try to log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        errorMessage = ""
        // checks to see if the fields are filled out
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please Fill in All Required Fields"
            return false }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please Enter a Valid Email"
            return false }
        
        return true
        
        
        // print statement for testing
        // print("Called")
    }
}
