//
//  apiGet.swift
//  Api`s
//
//  Created by Mohamed Arafa on 8/23/18.
//  Copyright © 2018 Swaqny. All rights reserved.
//

import Foundation

struct apiGet : Codable{
    
    let id:Int
    let name:String
    let img:String
    let location:String
    let phone:String
    let rate:Float
    let foods:[foods]
}

struct foods : Codable{
    
    let id:Int
    let name:String
    let content:String
    let salary:String
    let image:String
    let rate:Float
}
