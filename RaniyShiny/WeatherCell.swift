//
//  WeatherCell.swift
//  RaniyShiny
//
//  Created by smallword on 2017/9/4.
//  Copyright © 2017年 smallword. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    
    @IBOutlet weak var highTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = forecast.lowTemp
        highTemp.text = forecast.highTemp
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.date
    }


}
