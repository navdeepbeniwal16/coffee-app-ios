//
//  CoffeeListView.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 12/12/21.
//

import SwiftUI
import FirebaseStorage

struct CoffeeListView: View {
    let recipes: [Recipe]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(recipes) { recipe in
                    
                    CoffeeLandscapeView(recipe: recipe)
                }
            }
        }
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView(recipes: [])
    }
}

struct CoffeeLandscapeView: View {
    let recipe:Recipe
    
    var formattedRating:String {
        return String(format: "%.1f", recipe.currentRating)
    }
    var numOfRatings:Int {
        recipe.ratingsList.count
    }
    
    @State var coffeeImage = UIImage(systemName: "cup.and.saucer")
    
    var body: some View {
        HStack {
            Image(uiImage: coffeeImage!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(5)
                .onAppear(perform: downloadImage)
            
            
            VStack(alignment:.leading) {
                HStack {
                    Text("\(recipe.title)")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
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
                }
                
                HStack {
                    Image(systemName: "person.circle.fill")
                    Text(recipe.sourceBarista)
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    Text("\(numOfRatings) Ratings")
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
}
