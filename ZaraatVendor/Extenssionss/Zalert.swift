//
//  Zalert.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 7/27/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import  SwiftMessages
class Zalert {
     static let ZshareAlert = Zalert()
    private init(){}
    
   
    
    func showAlert(title: String, message: String, messagetype: Int ) {
         var config = SwiftMessages.Config()
        config.duration = .seconds(seconds: 2)
        config.dimMode = .gray(interactive: true)
        
        let view = MessageView.viewFromNib(layout: .cardView)
        view.button?.isHidden =  true
        if messagetype == 0 {
        view.configureTheme(.error, iconStyle: .default)
        } else if messagetype == 1 {
            view.configureTheme(.success, iconStyle: .default)
        } else if messagetype == 2 {
            view.configureTheme(.warning, iconStyle: .default)
        } else {
            view.configureTheme(.info, iconStyle: .default)
        }
        view.configureDropShadow()
        let iconText = ["🤔", "😳", "🙄", "😶"].randomElement()!
        view.configureContent(title: title, body: message, iconText: iconText)
//UIScreen.main.bounds.height / 2
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10

        SwiftMessages.show(view: view)
        
    }
    func hidAlert(){
        SwiftMessages.hide()
    }
    
}
