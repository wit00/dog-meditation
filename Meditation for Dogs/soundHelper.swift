//
//  soundHelper.swift
//  Meditation for Dogs
//
//  Created by Whitney Powell on 4/11/16.
//  Copyright © 2016 Whitney Powell. All rights reserved.
//

import Foundation
import AVFoundation

class SoundHelper {
    static func getAnAVAudioOptionalInstance(fileName:String,fileType:String) -> AVAudioPlayer? {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
        let url = NSURL.fileURLWithPath(path!)
        var audioPlayer:AVAudioPlayer?
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            // what do i do if the audio player doesn't work?
            print("audio player not available")
        }
        return audioPlayer
    }
}