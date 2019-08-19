//
//  ViewController.swift
//  MuniMobile
//
//  Created by Jangey Lu on 8/16/19.
//  Copyright © 2019 Jangey Lu. All rights reserved.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController {

    var QRcodeCheck:Bool = false
    
    @IBOutlet weak var backgroundView: FLAnimatedImageView!
    @IBOutlet weak var QRcodeIMG: UIImageView!
    
    
    @IBOutlet weak var expireTimeLabel: UILabel!
    @IBOutlet weak var activateTimeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var letterLabel: UILabel!
    
    
    // tap Screen to show / hide QRcode
    @IBAction func tapGesture(_ sender: Any) {
        if(!QRcodeCheck) {
            view.bringSubviewToFront(activateTimeLabel)
            QRcodeIMG.isHidden = false
            QRcodeCheck = !QRcodeCheck
        } else {
            view.bringSubviewToFront(expireTimeLabel)
            QRcodeIMG.isHidden = true
            QRcodeCheck = !QRcodeCheck
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let now = Date().addingTimeInterval(-1440) // now = backward 24 mins
        let expireTime = now.addingTimeInterval(7200) // 2 hours = 7200 secs
        // for Date
        let formatterDay = DateFormatter()
        formatterDay.timeZone = TimeZone.current
        formatterDay.dateFormat = "MM/dd/YY"
        // for expireTime
        let formatterTime = DateFormatter()
        formatterTime.timeZone = TimeZone.current
        formatterTime.dateFormat = "h:mm:ss a"
        
        
        
        dateLabel.text = formatterDay.string(from: now)
        expireTimeLabel.text = (formatterTime.string(from: expireTime))
        activateTimeLabel.text = (formatterTime.string(from: now))
        
        
        let path1 : String = Bundle.main.path(forResource: "background", ofType: "gif")!
        let url = URL(fileURLWithPath: path1)
        let gifData = try? Data(contentsOf: url)
        let imageData1 = FLAnimatedImage(animatedGIFData: gifData)
        backgroundView.animatedImage = imageData1
        
    }

}

