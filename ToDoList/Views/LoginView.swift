//
//  LoginView.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
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
                        //first argument is placeholder, second is a binding that needs to be created before the body variable
                    TextField("Email Address", text: $email)
                            //style is the argument of textField Style, can choose any
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button {
                        // attempt login
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius:20)
                                .foregroundColor(Color.blue)
                            
                            Text("Login")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
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
