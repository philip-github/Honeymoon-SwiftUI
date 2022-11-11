//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//


import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    
    if let urlPath = Bundle.main.url(forResource: sound, withExtension: type) {
        do{
            let data = try Data(contentsOf: urlPath)
            audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer?.play()
        }catch{
            print("Error [  ] failed to play sound file!")
        }
    }
}
