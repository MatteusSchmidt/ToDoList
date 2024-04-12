//
//  LoginView.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView() {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           angle: 15,
                           background: Color.pink)
                
                
                // Login Form
                Form {
                    // checking to see if fields are empty in the form
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                        //first argument is placeholder, second is a binding that needs to be created before the body variable
                    TextField("Email Address", text: $viewModel.email)
                            //style is the argument of textField Style, can choose any
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)

                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TDLButton(
                        title: "Login",
                        color: .blue
                    ) {
                            //Attempt login
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                
                //Create account
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                //to push the zstack up
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
