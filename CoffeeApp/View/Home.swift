//
//  Home.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 05/11/21.
//
// This is in develop branch
import SwiftUI

struct Home: View {
    @ObservedObject var recipeVM:RecipeViewModel = RecipeViewModel()
    
    var body: some View {
        VStack {
            // Header
            HStack {
                
                
                VStack(alignment: .leading) {
                    Text("Good morning")
                        .font(.title)
                    Text("Eduardo Yuda")
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
            }
            .padding([.horizontal])
            
            ScrollView {
                TabView {
                    ZStack {
                        Image("CoffeeImage1")
                            .resizable()
                        
                        VStack {
                            Spacer()
                            HStack(alignment: .center) {
                                ZStack {
                                    
                                    Text("Coffee Description Text")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(5)
                                        .background(Color.black)
                                        .opacity(0.7)
                                        .padding([.bottom])
                                        .padding([.bottom])
                                        
                                }
                                
                                Spacer()
                            }
                            
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding(5)
                    
                    ZStack {
                        Image("CoffeeImage2")
                            .resizable()
                        
                        VStack {
                            Spacer()
                            HStack(alignment: .center) {
                                ZStack {
                                    
                                    Text("Coffee Description Text")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(5)
                                        .background(Color.black)
                                        .opacity(0.7)
                                        .padding([.bottom])
                                        .padding([.bottom])
                                        
                                }
                                
                                Spacer()
                            }
                            
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding(5)

                    ZStack {
                        Image("CoffeeImage3")
                            .resizable()
                        
                        VStack {
                            Spacer()
                            HStack(alignment: .center) {
                                ZStack {
                                    
                                    Text("Coffee Descrition Text")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .padding(5)
                                        .background(Color.black)
                                        .opacity(0.7)
                                        .padding([.bottom])
                                        .padding([.bottom])
                                        
                                }
                                
                                Spacer()
                            }
                            
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding(5)
                    
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: 360,height: 220, alignment: .center)
                
                HStack {
                    Text("Trending Recipes")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    NavigationLink  {
                        CoffeeListView()
                    } label: {
                        Text("See more")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(AppColors.coffeeColorFive)
                    }

                    
                }
                .padding([.horizontal, .top])
                
                ScrollView(.horizontal,  showsIndicators: false) {
                    HStack(spacing: 20) {
                        
                        ForEach(recipeVM.trendingRecipes) { recipe in
                            
                            CoffeeTileView(title: recipe.title, sourceBarista: recipe.sourceBarista, rating: recipe.currentRating, isBookmarked: recipe.bookMarked, ratings: recipe.ratingsList, imagePath: recipe.imageUrl)
                            
                        }
                        
                    }
                    .padding([.horizontal])
                }
                
                HStack {
                    Text("Newest Recipes")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("See more")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.coffeeColorFive)
                }
                .padding([.horizontal, .top])
                
                
                ScrollView(.horizontal,  showsIndicators: false) {
                    HStack(spacing: 20) {
                       
                        ForEach(recipeVM.latestRecipes) { recipe in
                            CoffeeTileView(title: recipe.title, sourceBarista: recipe.sourceBarista, rating: recipe.currentRating, isBookmarked: recipe.bookMarked, ratings: recipe.ratingsList, imagePath: recipe.imageUrl)
                            
                        }
                    }
                    .padding([.horizontal])
                }
               
                HStack {
                    Text("Popular Baristas")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("See more")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.coffeeColorFive)
                }
                .padding([.horizontal, .top])
                
                ScrollView(.horizontal,  showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(recipeVM.topBaristas){ barista in
                            
                            BaristaTileView(title: barista.baristaName)
                            
                        }
                    }
                    .padding([.horizontal])
                }
                
                Spacer()

            }
            
            Spacer()
        }
        .onAppear {
            recipeVM.loadTrendingRecipesData()
            recipeVM.loadLatestRecipesData()
            recipeVM.loadTopBaristasData()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
