//
//  RegisterView.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Start Organizing To-Dos",
                       angle: -15,
                       background: Color.orange)
            
            Spacer()
        }
        .padding(.top, 5)
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
