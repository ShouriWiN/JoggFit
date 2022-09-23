//
//  MainViewController.swift
//  JoggFit
//
//  Created by Shouri Isaji on 2022/09/23.
//

import UIKit
import Foundation
import CoreMotion
import AVFoundation

class MainViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    var audioPlayerInstance : AVAudioPlayer! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func morningButton(_ sender: Any) {
        playBGM(name: "bgm")
    }
    
    
    @IBAction func noonButton(_ sender: Any) {
        playSE(fileName: "SE", extentionName: "mp3")
    }
    
    
    @IBAction func nightButton(_ sender: Any) {
        
    }
    
    
    @IBAction func midnightButton(_ sender: Any) {
        
    }
    
    func playBGM(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self
            
            // 音声の再生
            audioPlayer.play()
        } catch {
        }
    }
    
    func playSE(fileName:String, extentionName:String){
        //パスを生成
        guard let soundFilePath = Bundle.main.path(forResource:fileName, ofType: extentionName) else {
            print("サウンドファイルが見つかりません。")
            return
        }
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        
        // AVAudioPlayerのインスタンスを作成,ファイルの読み込み
        do {
            audioPlayerInstance = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("AVAudioPlayerインスタンス作成でエラー")
        }
        
        //バックミュージック流しながらでも効果音を流すコード
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(AVAudioSession.Category.ambient)
            try audioSession.setActive(true)
        } catch let error {
            print(error)
        }
        
        audioPlayerInstance.prepareToPlay()  // 再生準備
        audioPlayerInstance.currentTime = 0  // 再生箇所を頭に移す
        audioPlayerInstance.play()
    }
    
}


