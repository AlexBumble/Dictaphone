//
//  TraksPlayer.swift
//  Dictaphone
//
//  Created by Алексей Бузов on 23.01.2020.
//  Copyright © 2020 Alexey Buzov. All rights reserved.
//

import UIKit
import AVFoundation

protocol Player {
    func addTrack(recordedTrack: TracksDataModel)
    func play()
    func stop()
}

class TraksPlayer: Player {

    var audioPlayer = AVAudioPlayer()

    func play() {
        audioPlayer.play()
    }

    func stop() {
        audioPlayer.stop()
    }

    func addTrack(recordedTrack: TracksDataModel) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: recordedTrack.filePathUrl)
        }
        catch {
            // ToDo Error
        }
        audioPlayer.prepareToPlay()
    }
}

