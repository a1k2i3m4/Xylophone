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
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                           animations: {
                sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }) { (finished) in
                UIView.animate(withDuration: 0.1) {
                    sender.transform = CGAffineTransform.identity
                }
            }
        
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

