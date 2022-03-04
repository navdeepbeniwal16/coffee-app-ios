//
//  CoffeeTileView.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 10/11/21.
//

import SwiftUI
import FirebaseStorage

struct CoffeeTileView: View {
    
    let recipe: Recipe
    var numOfRatings:Int {
        recipe.ratingsList.count
    }
    var formattedRating:String {
        return String(format: "%.1f", recipe.currentRating)
    }
    
    @State var coffeeImage = UIImage(systemName: "cup.and.saucer")
    
    func downloadImage() {
        let downloadRef = Storage.storage().reference(withPath: recipe.imageUrl)
        let downloadTaskRef = downloadRef.getData(maxSize: 4 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error: Failed to download image from Firebase")
                return
            }
            
            guard let imageData = data else { return }
            
            print(String(describing: imageData))
            self.coffeeImage = UIImage(data: imageData)
        }
    }
    
    var body: some View {

        VStack {
            
            ZStack {
                Image(uiImage: coffeeImage!)
                    .resizable()
                    .onAppear(perform: downloadImage)
                    
                
                if(recipe.bookMarked) {
                    VStack {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 20, height: 40, alignment: .trailing)
                                .foregroundColor(AppColors.coffeeColorFour)
                                .padding(.horizontal, 12)
                                .offset(y: -6)
                        }
                        .padding(.top, 0)
                        
                        Spacer()
                    }
                    .padding(.top, 0)
                }
                
            }
            .frame(width: 160, height: 100, alignment: .center)

            VStack(spacing: 5) {
                HStack {
                    Text(recipe.title)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                }
                
                HStack {
                    Image(systemName: "person.circle")
                    
                    Text(recipe.sourceBarista)
                        .font(.system(size: 12))
                    
                    Spacer()
                }
                .foregroundColor(
                    Color.black
                        .opacity(0.7)
                )
                
                HStack {
                    HStack {
                        Text("\(formattedRating)")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                        Image(systemName: "star.fill")
                            .font(.system(size: 12))
                    }
                    .padding(.vertical, 3)
                    .padding(.horizontal, 7)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                    
                    Text("\(numOfRatings) Ratings")
                        .font(.system(size: 10))
                        .foregroundColor(AppColors.coffeeColorFour)
                        .fontWeight(.black)
                }
            }
            .padding([.horizontal], 8)
            .padding([.vertical], 8)
            .frame(width: 160, alignment: .center)
            
            
        }
        .background(AppColors.coffeeColorTwo)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CoffeeTileView_Previews: PreviewProvider {
    static let recipe: Recipe = Recipe(title: "Ice Latte", sourceBarista: "Neel Yang", currentRating: 4.3, bookMarked: true, ratingsList: [4, 5,3, 6], imageUrl: "/CoffeeImages/CoffeeImage1.jpeg")
    static var previews: some View {
        CoffeeTileView(recipe: recipe)
    }
}
