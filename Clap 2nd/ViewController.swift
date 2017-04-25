//
//  ViewController.swift
//  Clap 2nd
//
//  Created by Koki Ide on 2017/04/25.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //再生する音源のURLを生成
        let soundFilePath = Bundle.main.path(forResource: "clap", ofType: "wav")!
        let fileURL = URL(fileURLWithPath: soundFilePath)
        
        //AVAudioPlayer　のインスタンス化
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        } catch {
            print("音楽ファイルが読み込めませんでした")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playbutton(){
    audioPlayer.play()
    }


}

