//
//  apiPost.swift
//  Api`s
//
//  Created by Mohamed Arafa on 8/23/18.
//  Copyright © 2018 Swaqny. All rights reserved.
//

import Foundation


struct apiPost : Codable{
    
    let email:String
    let password:String    
    
}


/*
 
 /post/login => post
 @query ('email', 'password')
 @response
 
 */
