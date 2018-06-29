//
//  ViewController.swift
//  HelloPlayAudio
//
//  Created by 林奕德 on 2018/3/25.
//  Copyright © 2018年 AppsAdamLin. All rights reserved.
//

import UIKit
import AVFoundation //媒體

class ViewController: UIViewController {
    var audioPlayer:AVAudioPlayer?
    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0.0 //時間點回歸
        audioPlayer?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //find sound path
        if  let path =  Bundle.main.path(forResource: "Right", ofType: "mp3"){//聲音檔路徑
        //解optional  path to url
          let url =  URL(fileURLWithPath: path)
           //make an sound plater
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf:url)
            audioPlayer?.enableRate = true //可調速度
           // audioPlayer?.rate = 2.0 //速度大小(兩倍)
            audioPlayer?.numberOfLoops = -1 //重播(加負號表無限)
            audioPlayer?.volume = 0.5 // 音量
             }catch{
                    print(error.localizedDescription)
                }
        }else {
            print("no such file")
        }
        guard let newPath =  Bundle.main.path(forResource: "Right", ofType: "mp3") else {
            print("no such path")
            return  //確認一定有值 可以存進newPath裡 能執行
            //guard判斷式的外面還是可以拿到guard裡的var or let
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

