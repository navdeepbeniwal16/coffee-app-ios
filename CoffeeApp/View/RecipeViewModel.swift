//
//  RecipeViewModel.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 13/11/21.
//

import Foundation
class RecipeViewModel:ObservableObject {
    let trendingRecipesUrlString:String = "http://MacBook-Pro.local:8080/recipes/trending"
    let latestRecipesUrlString:String = "http://MacBook-Pro.local:8080/recipes/latest"
    let topBaristasUrlString:String = "http://MacBook-Pro.local:8080/baristas/top"
    
    @Published var trendingRecipes:[Recipe] = []
    @Published var latestRecipes:[Recipe] = []
    @Published var topBaristas:[Barista] = []
    
    func loadTrendingRecipesData(){
        self.loadTrendingRecipesDataFromUrl()
    }
    
    func loadTrendingRecipesDataFromUrl(){
        let url = URL(string: trendingRecipesUrlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error : \(error!)")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            
            guard let dataString = String(data: data, encoding: .utf8) else {
                print("Couldn't create data string!")
                return
            }
            
            self.decodedTrendingRecipes(recipeData: data)
        }
        task.resume()
    }
    
    func decodedTrendingRecipes(recipeData: Data){
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodedRecipesData = try jsonDecoder.decode(RecipesData.self, from: recipeData)
            
            DispatchQueue.main.async {
                self.trendingRecipes = decodedRecipesData.recipes
            }
            
        } catch {
            print("Error occured while decoding recipies data : \(error)")
        }
    }
    
    
}

// Network Handling for Latest Recipes
extension RecipeViewModel {
    func loadLatestRecipesData(){
        self.loadLatestRecipesDataFromUrl()
    }
    
    func loadLatestRecipesDataFromUrl(){
        let url = URL(string: latestRecipesUrlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error : \(error!)")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            
            guard let dataString = String(data: data, encoding: .utf8) else {
                print("Couldn't create data string!")
                return
            }
            
            self.decodedLatestRecipes(recipeData: data)
        }
        task.resume()
    }
    
    func decodedLatestRecipes(recipeData: Data){
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodedRecipesData = try jsonDecoder.decode(RecipesData.self, from: recipeData)
            
            DispatchQueue.main.async {
                self.latestRecipes = decodedRecipesData.recipes
            }
            
        } catch {
            print("Error occured while decoding recipies data : \(error)")
        }
    }
}

// Network Handling for Top Baristas
extension RecipeViewModel {
    func loadTopBaristasData(){
        self.loadTopBaristasDataFromUrl()
    }
    
    func loadTopBaristasDataFromUrl(){
        let url = URL(string: topBaristasUrlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error : \(error!)")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            
            guard let dataString = String(data: data, encoding: .utf8) else {
                print("Couldn't create data string!")
                return
            }
            
            self.decodedTopBaristas(baristaData: data)
        }
        task.resume()
    }
    
    func decodedTopBaristas(baristaData: Data){
        let jsonDecoder = JSONDecoder()
        
        do {
            let decodedBaristasData = try jsonDecoder.decode(BaristaData.self, from: baristaData)
            
            DispatchQueue.main.async {
                self.topBaristas = decodedBaristasData.baristas
            }
            
        } catch {
            print("Error occured while decoding baristas data : \(error)")
        }
    }
}
