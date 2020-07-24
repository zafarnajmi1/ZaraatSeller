//
//  AddimageVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 03/04/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class AddimageVC: UIViewController {

    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var btnaddimg: UIButton!
    @IBOutlet weak var imgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Image"
        addBackButton()
        self.btnaddimg.roundButton()
        imgView.layer.cornerRadius = 8
        mainview.roundViewAndBorder(border: 1, color: #colorLiteral(red: 0.7643175721, green: 0.7766392827, blue: 0.7724317908, alpha: 1))
    }
    

    
}
