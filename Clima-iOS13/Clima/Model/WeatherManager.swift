//
//  WeatherManager.swift
//  Clima
//
//  Created by Renzo on 3/10/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=c9274720797d02d87b7736bfaf6b1f0b&units=metric";
    let session = URLSession.shared
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName : String)  {
        let urlString = "\(weatherURL)&q=\(cityName)";
        performRequest(urlString: urlString);
    }
        
    func fetchWeatherByCoordinatnates(lat : String, lon: String)  {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)";
        performRequest(urlString: urlString);
    }
    
    
    func performRequest(urlString: String)  {
        if let url = URL(string: urlString ) { //1. create URL
            let session = URLSession(configuration: .default) //2. Create a URLSession
            //            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:)); //3. Give the session a task
            let task = session.dataTask(with: url) {
                (data, response, error) in //CLOSURE
                if error != nil {
                    print("CALLING FAILED")
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    print("PASSED!!!")
                    if let weather = self.parseJSON(weatherData: safeData) {
                        print("Calling delegate!")
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume(); //4. Start the task
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel?  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather;
        } catch {
            print("Something went wrong!");
        }
        return nil;
    }
    
  
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
    
}


