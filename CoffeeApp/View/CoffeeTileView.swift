//
//  CoffeeTileView.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 10/11/21.
//

import SwiftUI
import FirebaseStorage

struct CoffeeTileView: View {
    let coffeeColorTwo = Color(UIColor(red: 0.93, green: 0.88, blue: 0.83, alpha: 1.00))
    let coffeeColorThree = Color(UIColor(red: 0.87, green: 0.72, blue: 0.57, alpha: 1.00))
    let coffeeColorFour = Color(UIColor(red: 0.69, green: 0.54, blue: 0.41, alpha: 1.00))
    
    let title:String
    let sourceBarista:String
    let rating:Float
    let isBookmarked:Bool
    let ratings:[Float]
    var numOfRatings:Int {
        ratings.count
    }
    let imagePath:String
    
    var formattedRating:String {
        return String(format: "%.1f", rating)
    }
    
    @State var coffeeImage = UIImage(systemName: "cup.and.saucer")
    
    func downloadImage() {
        let downloadRef = Storage.storage().reference(withPath: self.imagePath)
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
                    
                
                if(isBookmarked) {
                    VStack {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 20, height: 40, alignment: .trailing)
                                .foregroundColor(coffeeColorFour)
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
                    Text(title)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                }
                
                HStack {
                    Image(systemName: "person.circle")
                    
                    Text(sourceBarista)
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
                        .foregroundColor(coffeeColorFour)
                        .fontWeight(.black)
                }
            }
            .padding([.horizontal], 8)
            .padding([.vertical], 8)
            .frame(width: 160, alignment: .center)
            
            
        }
        .background(coffeeColorTwo)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CoffeeTileView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeTileView(title: "Ice Latte", sourceBarista: "Neel Yang", rating: 4.3, isBookmarked: true, ratings: [4, 5, 4, 5], imagePath: "/CoffeeImages/CoffeeImage1.jpeg")
    }
}
