//
//  TotalSalesVC.swift
//  ZaraatVendor
//
//  Created by Zafar Najmi on 27/03/2020.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import  XLPagerTabStrip
import  Charts
import  SwiftCharts
class TotalSalesVC: DemoBaseViewController,IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "TOTAL SALE")
        
    }
    
   // @IBOutlet weak var myview: UIView!
    
    @IBOutlet weak var pendingView: UIView!
    @IBOutlet weak var cancelView: UIView!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var pkrView: UIView!
    @IBOutlet weak var newcustomerView: UIView!
    @IBOutlet weak var customerView: UIView!
    var barchart : BarsChart!
    
    @IBOutlet var chartView: BarChartView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        pendingView.roundView()
         cancelView.roundView()
         totalView.roundView()
         pkrView.roundView()
        newcustomerView.roundView()
         customerView.roundView()
        
        
        self.title = "Sale"
        addBackButton()
        setNavigationBar()
        UIApplication.shared.setStatusBar()
//        let chartConfig = BarsChartConfig( valsAxisConfig: ChartAxisConfig(from: 0, to: 1000, by: 100))
//            
//         let frame = CGRect(x: 0, y: 150, width: self.view.frame.width, height: 300)
//        let Chart = BarsChart(frame: frame,
//                              chartConfig: chartConfig,
//                              xTitle: "Months",
//                              yTitle: "Units Sold" ,
//                              bars: [("Jan",70),
//                                     ("Fed",90),
//                                     ("Marc",200),
//                                     ("Apr",23),
//                                     ("May",56),
//                                     ("Jun",10),
//                                     ("Jul",45),
//                                     ("Aug",30),
//                                     ("Sep",100),
//                                     ("Oct",50),
//                                     ("Nov",60),
//                                     ("Dec",100)],
//                                     color: #colorLiteral(red: 0.03137254902, green: 0.2980392157, blue: 0.09411764706, alpha: 1),
//                                     barWidth: 20)
//        self.view.addSubview(Chart.view)
//        self.barchart = Chart
        chartView1()
    }
    
   
    func chartView1(){
        
        self.options = [.toggleValues,
                                .toggleHighlight,
                                .animateX,
                                .animateY,
                                .animateXY,
                                .saveToGallery,
                                .togglePinchZoom,
                                .toggleData,
                                .toggleBarBorders]
                
                self.setup(barLineChartView: chartView)
                
                chartView.delegate = self
                
                chartView.drawBarShadowEnabled = false
                chartView.drawValueAboveBarEnabled = false
                
                chartView.maxVisibleCount = 60
                
                let xAxis = chartView.xAxis
                xAxis.labelPosition = .bottom
                xAxis.labelFont = .systemFont(ofSize: 10)
                xAxis.granularity = 1
                xAxis.labelCount = 7
                xAxis.valueFormatter = DayAxisValueFormatter(chart: chartView)
                
                let leftAxisFormatter = NumberFormatter()
                leftAxisFormatter.minimumFractionDigits = 0
                leftAxisFormatter.maximumFractionDigits = 1
                leftAxisFormatter.negativeSuffix = " $"
                leftAxisFormatter.positiveSuffix = " $"
                
                let leftAxis = chartView.leftAxis
                leftAxis.labelFont = .systemFont(ofSize: 10)
                leftAxis.labelCount = 8
                leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
                leftAxis.labelPosition = .outsideChart
                leftAxis.spaceTop = 0.15
                leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
                
                let rightAxis = chartView.rightAxis
                rightAxis.enabled = true
                rightAxis.labelFont = .systemFont(ofSize: 10)
                rightAxis.labelCount = 8
                rightAxis.valueFormatter = leftAxis.valueFormatter
                rightAxis.spaceTop = 0.15
                rightAxis.axisMinimum = 0
                
                let l = chartView.legend
                l.horizontalAlignment = .left
                l.verticalAlignment = .bottom
                l.orientation = .horizontal
                l.drawInside = false
                l.form = .circle
                l.formSize = 9
                //l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
                l.xEntrySpace = 4
        //        chartView.legend = l

//                let marker = XYMarkerView(color: UIColor(white: 180/250, alpha: 1),
//                                          font: .systemFont(ofSize: 12),
//                                          textColor: .white,
//                                          insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8),
//                                          xAxisValueFormatter: chartView.xAxis.valueFormatter!)
//                marker.chartView = chartView
//                marker.minimumSize = CGSize(width: 80, height: 40)
//                chartView.marker = marker
                
//                sliderX.value = 12
//                sliderY.value = 50
//                slidersValueChanged(nil)
         self.setDataCount(Int(12) + 1, range: UInt32(50))
    }
    


           
        
        
        func setDataCount(_ count: Int, range: UInt32) {
            let start = 1
            
            let yVals = (start..<start+count+1).map { (i) -> BarChartDataEntry in
                let mult = range + 1
                let val = Double(arc4random_uniform(mult))
                if arc4random_uniform(100) < 25 {
                    return BarChartDataEntry(x: Double(i), y: val, icon: UIImage(named: "icon"))
                } else {
                    return BarChartDataEntry(x: Double(i), y: val)
                }
            }
            
            var set1: BarChartDataSet! = nil
            if let set = chartView.data?.dataSets.first as? BarChartDataSet {
                set1 = set
                set1.replaceEntries(yVals)
                chartView.data?.notifyDataChanged()
                chartView.notifyDataSetChanged()
            } else {
                set1 = BarChartDataSet(entries: yVals, label: "The year 2020")
                set1.colors = ChartColorTemplates.material()
                set1.drawValuesEnabled = false
                
                let data = BarChartData(dataSet: set1)
                data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
                data.barWidth = 0.9
                chartView.data = data
            }
            
    //        chartView.setNeedsDisplay()
        }

}
