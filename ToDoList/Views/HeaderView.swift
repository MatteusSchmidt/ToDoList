//
//  HeaderView.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        // Header
            //makes a stackable object
        ZStack {
                //makes a rectangle which is then pink
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
                //to make the spacing of the header nicer
            .padding(.top, 80)
        }
            // adjusts the size of the rectangle that was created in the zstack
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
            // changes the location of the zstack header
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   subtitle: "Subtitle",
                   angle: 15,
                   background: Color.pink)
    }
}
