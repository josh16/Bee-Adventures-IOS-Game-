//
//  GameScene.swift
//  Bee Adventure Game
//
//  Created by Joshua Randall on 2017-03-05.
//  Copyright © 2017 Josh/Matt/Jon. All rights reserved.
//

import SpriteKit
//import GameplayKit

class GameScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Main Menu
        for touch in touches
        {
            let location = touch.location(in: self);
            //MainMenu Code
            if atPoint(location).name == "TheMenu"{
                
                
                if let scene = MainMenu(fileNamed: "MainMenu") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(2)))
                    
                    
                }
                
                
                
            }
            
         
            
        
        }
        
    }





}
