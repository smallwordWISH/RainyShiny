//
//  Forecast.swift
//  RaniyShiny
//
//  Created by smallword on 2017/9/4.
//  Copyright © 2017年 smallword. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp:  String!
    var _lowTemp: String!
    
    var forecasts = [Forecast]()
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let min = temp["temp_min"] as? Double {
                
                let temptemp = min - 273
                
                self._lowTemp = "\(temptemp)"
                
            }
        
            if let max = temp["temp_max"] as? Double {
            
                let temptemp = max - 273
            
                self._highTemp = "\(temptemp)"
            
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
        
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        //Downloading forecast wweather data for tableview
        
        let forecastURL = URL(string: FORECAST_URL)!
        
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                }
            }
            completed()
        }
    }
    
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
