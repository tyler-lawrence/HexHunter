//
//  GameCenterManager.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/26/24.
//

import Foundation
import GameKit

class GameCenterManager {
    
    static var shared = GameCenterManager()
    
    var localPlayer = GKLocalPlayer.local
    private(set) var isGameCenterEnabled: Bool = false
    
    func authenticateLocalPlayer(){
        localPlayer.authenticateHandler = { _, error in
            if error != nil {
                print(error!.localizedDescription)
            }  else if self.localPlayer.isAuthenticated {
                self.isGameCenterEnabled = true
            } else {
                print("could not authenticate")
            }
        }
    }
    
}
