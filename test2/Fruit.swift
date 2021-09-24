//
//  Fruit.swift
//  test2
//
//  Created by duytran on 9/24/21.
//

import Foundation
enum Status {
    case Empty
    case FreeShip(String)
    case Sale(String)
}
struct Fruit {
    var name:String
    var imageName:String
    var description:String
    var unit:String
    var price:Double
    var protomationalPrice:Double
    var isFavor:Bool
    var rating:Double
    var ratingCout:Int
    var status:Status
}
