//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 25/03/23.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String)  {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch{
            print("Error to find the sound file")
        }
    }
}
