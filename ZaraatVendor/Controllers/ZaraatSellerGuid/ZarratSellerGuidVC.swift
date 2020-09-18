//
//  ZarratSellerGuidVC.swift
//  ZaraatVendor
//
//  Created by ZafarNajmi on 9/18/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import PDFKit
class ZarratSellerGuidVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Zaraat Seller Guide"
         addBackButton()
        let pdfView = PDFView(frame: view.frame)
             
             
             if let url = Bundle.main.url(forResource: "Zaraat Seller Guide", withExtension: "pdf"),
                 let pdfDocument = PDFDocument(url: url) {
                 pdfView.displayMode = .singlePageContinuous
                 pdfView.autoScales = true
                 pdfView.displayDirection = .vertical
                 pdfView.document = pdfDocument
                 
                 view.addSubview(pdfView)
             }
    }
    

    

}
