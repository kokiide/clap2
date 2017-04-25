//
//  ViewController.swift
//  Clap 2nd
//
//  Created by Koki Ide on 2017/04/25.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    var audioPlayer: AVAudioPlayer!
    @IBOutlet var clapPickerView: UIPickerView!
    var soundCount: Int = 0
    
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
        clapPickerView.dataSource = self
        clapPickerView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playbutton(){
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
    
    //いくつカテゴリーを持つか
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //いくつ選択肢を作るか
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //選択肢に何を表示していくか１
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)回"
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    



}

