//
//  BaristaData.swift
//  CoffeeApp
//
//  Created by Navdeep Beniwal on 17/11/21.
//

import Foundation

struct BaristaData : Codable {
    let baristas:[Barista]
}

struct Barista : Codable, Identifiable {
    let id = UUID()
    let baristaName:String
    let baristaImageUrl:String
    let baristaRating:Float
}
