//
//  BaristaTileView.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 12/11/21.
//

import SwiftUI

struct BaristaTileView: View {
    
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
                    AppColors.coffeeColorFour
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
