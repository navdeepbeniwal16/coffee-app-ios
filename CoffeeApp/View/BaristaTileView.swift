//
//  BaristaTileView.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 12/11/21.
//

import SwiftUI

struct BaristaTileView: View {
    let coffeeColorTwo = Color(UIColor(red: 0.93, green: 0.88, blue: 0.83, alpha: 1.00))
    let coffeeColorThree = Color(UIColor(red: 0.87, green: 0.72, blue: 0.57, alpha: 1.00))
    let coffeeColorFour = Color(UIColor(red: 0.69, green: 0.54, blue: 0.41, alpha: 1.00))
    
    let title:String
    
    var body: some View {
        // Barista Tile
        VStack {
            ZStack {
                Image("BaristaImage1")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white)
            
            }
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.black)
            .clipShape(Circle())
            
            Text(title)
                .fontWeight(.semibold)
                .padding(5)
                .padding(.horizontal, 10)
                .background(
                    coffeeColorFour
                )
                .foregroundColor(Color.white)
                .clipShape(Capsule())
                .offset(x: 0, y: -25)
                
        }
        .shadow(radius: 5)
        
    }
}

struct BaristaTileView_Previews: PreviewProvider {
    static var previews: some View {
        BaristaTileView(title: "Neel Yang")
    }
}
