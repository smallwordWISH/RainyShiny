//
//  Constants.swift
//  RaniyShiny
//
//  Created by smallword on 2017/9/2.
//  Copyright © 2017年 smallword. All rights reserved.
//

import Foundation

let baseURL = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longitude = "&lon="
let appID = "&appid="
let API_KEY = "451bdf841d9c47dafcf3728c61f55e04"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(baseURL)\(latitude)\(Location.sharedInstance.latitude!)\(longitude)\(Location.sharedInstance.longitude!)\(appID)\(API_KEY)"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=451bdf841d9c47dafcf3728c61f55e04"
