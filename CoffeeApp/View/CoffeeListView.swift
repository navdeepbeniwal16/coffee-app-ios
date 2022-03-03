//
//  CoffeeListView.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 12/12/21.
//

import SwiftUI

struct CoffeeListView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { row in
                    
                    HStack {
                        Image("CoffeeImage2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(5)
                        
                        
                        VStack(alignment:.leading) {
                            HStack {
                                Text("Recipe One")
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                HStack {
                                    Text("4.7")
                                        .font(.system(size: 12))
                                        .fontWeight(.semibold)
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 12))
                                }
                                .padding(.vertical, 3)
                                .padding(.horizontal, 7)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                            HStack {
                                Image(systemName: "person.circle.fill")
                                Text("Neil Yang")
                                    .font(.system(size: 12))
                                
                                Spacer()
                                
                                Text("4.3K Ratings")
                                    .font(.system(size: 10))
                                    .foregroundColor(AppColors.coffeeColorFour)
                                    .fontWeight(.black)
                            }
                        }
                        
                        Spacer()
                    }
                    .background(AppColors.coffeeColorTwo)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    .shadow(radius: 2)
                }
            }
        }
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView()
    }
}
