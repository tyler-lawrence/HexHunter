//
//  MusicPlayer.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/8/24.
//

import Foundation
import AVFAudio

@Observable
final class AudioPlayer {
    var audioPlayer: AVAudioPlayer?
    static let shared = AudioPlayer()
    /// plays a file looping indefinitely
    ///
    /// - Parameters:
    ///     - sound: name of the audio file in your xcode project
    ///     - type: type of file for sound parameter (ex: "mp3")
    /// - Returns:
    ///     - plays music if possible
    #if os(iOS)
    func startBackgroundLoop(sound: String, type: String) {
        if let bundle = Bundle.main.path(forResource: sound, ofType: type) {
            let soundURL = NSURL(fileURLWithPath: bundle)
            do {
                if !AVAudioSession.sharedInstance().isOtherAudioPlaying {
                    try AVAudioSession.sharedInstance().setCategory(.soloAmbient)
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
                    guard let backgroundAudioPlayer = audioPlayer else { return }
                    backgroundAudioPlayer.numberOfLoops = -1
                    backgroundAudioPlayer.prepareToPlay()
                    backgroundAudioPlayer.play()
                }
            } catch {
                print(error)
            }
        }
    }
    #else
    func startBackgroundLoop(sound: String, type: String) {
        if let bundle = Bundle.main.path(forResource: sound, ofType: type) {
            let soundURL = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
                guard let backgroundAudioPlayer = audioPlayer else { return }
                backgroundAudioPlayer.numberOfLoops = -1
                backgroundAudioPlayer.prepareToPlay()
                backgroundAudioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    #endif
    /// stops the file associated with this audio player
    func stopBackgroundSound() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}
