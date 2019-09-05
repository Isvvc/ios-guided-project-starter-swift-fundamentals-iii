//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Paul Solt on 6/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet var turkeyWeightTextField: UITextField!
    @IBOutlet var cookTimeTextField: UITextField!
    @IBOutlet var metricButton: UIButton!
    
    // Actions
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        guard let turkeyWeightString = turkeyWeightTextField.text else {
            return
        }
        
        guard let turkeyWeight = Double(turkeyWeightString) else {
            print("Invalid number")
            return
        }
        
        var durationInMinutes: Double
        
        if metricButton.isSelected {
            durationInMinutes = cookTimeInKilograms(turkeyWeight)
        } else {
            durationInMinutes = cookTimeInPounds(turkeyWeight)
        }
        
        // What if we wanted to print the number of hours?
        
        cookTimeTextField.text = "\(durationInMinutes) minutes"
    }
    
    @IBAction func metricButtonPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    // Helper functions
    
    func cookTimeInPounds (_ weight: Double) -> Double {
        let durationInMinutes = weight * 15.0
        return durationInMinutes
    }
    
    func cookTimeInKilograms (_ weight: Double) -> Double {
        var durationInMinutes: Double
        
        if weight >= 4 {
            durationInMinutes = 20.0 * weight + 90
        } else {
            durationInMinutes = 20.0 * weight + 70
        }
        
        return durationInMinutes
    }
}
