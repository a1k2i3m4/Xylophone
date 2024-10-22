//
//  ViewController.swift
//  Xylophone
//
//  Created by Akimbek Orazgaliev on 22.10.2024.
//

import UIKit

import AVFoundation


class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    
    let notes = ["C", "D", "E", "F", "G", "A", "B"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        var selectedSound = notes[(sender.tag)-1];
        playingSound(chosedSound: selectedSound)
        
    }
    func playingSound(chosedSound: String){
        let url = Bundle.main.url(forResource: chosedSound, withExtension: "wav")
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }catch{
            print(error)
        }
    }
}

