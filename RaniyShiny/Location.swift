//
//  Location.swift
//  RaniyShiny
//
//  Created by smallword on 2017/9/4.
//  Copyright © 2017年 smallword. All rights reserved.
//

import Foundation


class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
    
}
