//
//  JoggingViewController.swift
//  JoggFit
//
//  Created by recochoku03 on 2022/09/24.
//

import UIKit
import Foundation
import CoreMotion

class JoggingViewController: UIViewController {
    let pedometer = CMPedometer()
    
    
    
    @IBOutlet weak var stepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func startBtn(_ sender: Any) {
        //CMPedometerが利用可能かどうか
        if CMPedometer.isStepCountingAvailable() {
            
            //計測
            pedometer.startUpdates(from: Date(), withHandler: {(pedometerData, error) in
                if let e = error {
                    print(e.localizedDescription)
                    return
                }
                guard let data = pedometerData else {
                    return
                }
                let step = data.numberOfSteps
                DispatchQueue.main.async {
                    self.stepLabel.text = "\(step) 歩"
                    print(step)
                }
                if(Int(data.numberOfSteps) >= 10 &&  Int(data.numberOfSteps) <= 20){
                    
                }
            })
        }
    }
    
    @IBAction func stopBtn(_sender:Any) {
        pedometer.stopUpdates()
        
    }
}
