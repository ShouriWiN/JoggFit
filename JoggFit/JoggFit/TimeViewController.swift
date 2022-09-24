//
//  MainViewController.swift
//  JoggFit
//
//  Created by Shouri Isaji on 2022/09/23.
//

import UIKit
import Foundation
import CoreMotion


class TimeViewController: UIViewController {
    
    let sound = Sound()
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var nextLevelLablel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func morningButton(_ sender: Any) {
        sound.playBGM(name: "bgm")
    }
    
    
    @IBAction func noonButton(_ sender: Any) {
        sound.playSE(fileName: "SE", extentionName: "mp3")
        var alertTextField: UITextField?

                let alert = UIAlertController(
                    title: "Edit Name",
                    message: "Enter new name",
                    preferredStyle: UIAlertController.Style.alert)
                alert.addTextField(
                    configurationHandler: {(textField: UITextField!) in
                        alertTextField = textField
                        textField.text = self.levelLabel.text

                })
                alert.addAction(
                    UIAlertAction(
                        title: "Cancel",
                        style: UIAlertAction.Style.cancel,
                        handler: nil))
                alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: UIAlertAction.Style.default) { _ in
                        if let text = alertTextField?.text {
                            self.levelLabel.text = text
                            
                        }
                    }
                )

                self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func nightButton(_ sender: Any) {
        
    }
    
    
    @IBAction func midnightButton(_ sender: Any) {
        
    }
    
    @IBAction func slotButton(_ sender: Any) {
        
    }
    
        
}


