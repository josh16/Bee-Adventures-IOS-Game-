//
//  MainMenu.swift
//  Bee Adventure Game
//
//  Created by Joshua Randall on 2017-03-13.
//  Copyright © 2017 Josh/Matt/Jon. All rights reserved.
//

import SpriteKit


class MainMenu: SKScene{

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
   
        for touch in touches
        {
            let location = touch.location(in: self);
            let location2 = touch.location(in: self);
        
            //Game Scene Code
            if atPoint(location).name == "Go"{
            
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(2)))
                
                
                
                }
            
            
            
            }
        
            //LeaderBoard Code
            if atPoint(location2).name == "LeaderBoardButton"{
                
                if let scene = LeaderBoard(fileNamed: "LeaderBoard") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(2)))
                    
                    
                    
                }
                
                
                
            }

            
        }
        
        
        
        
        
        
        
        
    }

}
    

