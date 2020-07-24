//
//  AddFeatureVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 02/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class AddFeatureVC: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var txtView: UIView!
    
    @IBOutlet weak var btncreate: UIButton!
    @IBOutlet weak var txtdiscription: UITextView!
    @IBOutlet weak var titlView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        self.title = "Add Feature"
        setFeature()
    }
    
    func setFeature() {
        btncreate.roundButton()
        titlView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
         mainView.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
        txtView.layer.cornerRadius = 10
        txtView.layer.borderColor = #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1)
        txtView.layer.borderWidth = 1
    }
    

}
