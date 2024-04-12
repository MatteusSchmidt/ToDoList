//
//  TDLButton.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/9/23.
//

import SwiftUI

struct TDLButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius:10)
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct TDLButton_Previews: PreviewProvider {
    static var previews: some View {
        TDLButton(title: "Value",
                  color: .blue) {
            //Action
        }
    }
}
