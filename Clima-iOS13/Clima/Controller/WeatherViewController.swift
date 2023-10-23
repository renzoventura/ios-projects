//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        
        locationManager.requestLocation()

        weatherManager.delegate = self
        searchTextField.delegate = self //The textfield should report back to the view controller
    }

    @IBAction func getCurrentLocation(_ sender: UIButton) {
        locationManager.requestLocation();
    }
    
}


//MARK: - UITextFieldDelegate Section
extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(textField.text!)
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)  {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = "";
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.placeholder = "Search"
            return true
        } else {
            textField.placeholder = "Cannot be empty"
            return false
        }
    }
    
}

//MARK: - WeatherManagerDelegate Section
extension WeatherViewController : WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temperature)
        print("asd")
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print("FAILED TO UPDATE DATA!!! \(error)")
    }
}

//MARK: -
extension WeatherViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("GOT LOCATION DATA!")
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print(lat)
            print(lon)
            weatherManager.fetchWeatherByCoordinatnates(lat: String(lat), lon: String(lon))
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong!")
    }
}
