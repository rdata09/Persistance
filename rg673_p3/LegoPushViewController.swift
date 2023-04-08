//
//  LegoPushViewController.swift
//  rg673proj3
//
//  Created by Ryan Gomez on 3/15/23.
//

import UIKit

class LegoPushViewController: UIViewController {
    
    let ageLabel = UILabel()
    let mySlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Attributes"
        view.backgroundColor = .white
        
        ageLabel.text = ""
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageLabel)
        
        
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mySlider)
        
        setupConstraints()
    }
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            mySlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mySlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mySlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            ageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        ])
    }
}
