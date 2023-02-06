//
//  InfoViewController.swift
//  Get Films
//
//  Created by Aamer Essa on 07/12/2022.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var poersonGender: UILabel!
    @IBOutlet weak var personBirthYear: UILabel!
    @IBOutlet weak var personEyeColor: UILabel!
    @IBOutlet weak var personSkinColor: UILabel!
    @IBOutlet weak var personHairColor: UILabel!
    @IBOutlet weak var personMass: UILabel!
    @IBOutlet weak var personHeight: UILabel!
    @IBOutlet weak var personName: UILabel!
    
    var name = String()
    var height = String()
    var mass = String()
    var hairColor = String()
    var skinColor = String()
    var eyeColor = String()
    var birthYear = String()
    var gender = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        personName.text = name
        personHeight.text = height
        personMass.text = mass
        personHairColor.text = hairColor
        personSkinColor.text = hairColor
        personEyeColor.text = eyeColor
        personBirthYear.text = birthYear
        poersonGender.text = gender 
        
    }
    

    

}
