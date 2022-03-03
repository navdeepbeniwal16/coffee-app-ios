//
//  RecipeDecodableDataModel.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 13/11/21.
//

import Foundation

struct RecipesData : Codable {
    let recipes:[Recipe]
}

struct Recipe : Codable, Identifiable {
    let id = UUID()
    let title:String
    let sourceBarista:String
    let currentRating:Float
    let bookMarked:Bool
    let ratingsList:[Float]
    let imageUrl:String
}
