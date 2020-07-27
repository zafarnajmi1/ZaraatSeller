//
//  BaseVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidnavigationbar()
    }
    
    func setnavigationbar() {
        
    }
    
    func hidnavigationbar() {
        self.navigationController?.navigationBar.isHidden =  true
    }
    
    
        }


