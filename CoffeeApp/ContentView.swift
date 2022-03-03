//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 05/11/21.
//

import SwiftUI

struct ContentView: View {
    let coffeeColorOne = Color(UIColor(red: 0.93, green: 0.88, blue: 0.83, alpha: 1.00))
    let coffeeColorTwo = Color(UIColor(red: 0.93, green: 0.88, blue: 0.83, alpha: 1.00))
    let coffeeColorThree = Color(UIColor(red: 0.87, green: 0.72, blue: 0.57, alpha: 1.00))
    let coffeeColorFour = Color(UIColor(red: 0.69, green: 0.54, blue: 0.41, alpha: 1.00))
    let coffeeColorFive = Color(UIColor(red: 0.50, green: 0.33, blue: 0.22, alpha: 1.00))
    
    var tabBarIcons = ["house.fill", "flame.fill", "magnifyingglass", "bookmark.fill", "person.fill"]
    
    @State private var activeView = 0
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    switch activeView {
                    case 0:
                        Home()
                    default:
                        Text("Default View")
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
            
            
            HStack {
                ForEach(0..<5){ num in
                    Spacer()
                    Image(systemName: tabBarIcons[num])
                        .resizable()
                        .frame(width: 20, height: 23, alignment: .center)
                    
                        .foregroundColor(num == 0 ? .white : coffeeColorOne)
                    Spacer()
                }
            }
            .padding(15)
            .background(coffeeColorFive)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding([.horizontal])
//            .opacity(0.0)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
