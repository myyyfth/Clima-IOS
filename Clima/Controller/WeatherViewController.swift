//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate,WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delagate = self
        searchField.delegate = self
    }
    @IBAction func searchBTN(_ sender: UIButton) {
        searchField.endEditing(true)
        print(searchField.text!)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        print(searchField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "wajib Di isi"
            return false
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchField.text{
            weatherManager.fetchWeather(cityName: city)
        }        
        searchField.text = ""
    }
    
    func didUpdateWeather(weatherManager weatherMenager: WeatherManager ,weather :WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text =  weather.temperatureString
        }
 }
    func didFailWithError(error: Error) {
        print(error)
    }
}
