//
//  LeaderBoard.swift
//  Bee Adventure Game
//
//  Created by Joshua Randall on 2017-03-14.
//  Copyright © 2017 Josh/Matt/Jon. All rights reserved.
//

import SpriteKit

class LeaderBoard: SKScene {

    
    //reference to score from the other script..
    
    //HighScore variables
    
    /*
    var score : Int = 0
    var highscore: Int = 0
    var highscore1: Int = 0
    var highscore2: Int = 0
    var highscore3: Int = 0
    
    //Label references
    var hsLabel_1 = SKLabelNode()
    var hsLabel_2 = SKLabelNode()
    var hsLabel_3 = SKLabelNode()

    */
    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for touch in touches
        {
            let location = touch.location(in: self);
            
            if atPoint(location).name == "TheMenu"{
                
                //Going back Audio
                self.run(SKAction.playSoundFileNamed("Pickup_Coin9", waitForCompletion: false))
                
                if let scene = MainMenu(fileNamed: "MainMenu") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(2)))
                    
                    
                }
                
                
            }
            
        }
        
        
    }
    
    
    /*
    // Update HighScore function
    func updateHighScore()
    {
        
        if(score > highscore)
        {
            highscore = score
            
            if(highscore >= highscore1)
            {
                highscore1 = highscore
            }
            
            if(highscore1 > highscore >= highscore2)
            {
                highscore2 = highscore
            }
        
            
            if(highscore2 > highscore >= highscore3)
            {
                highscore3 = highscore
            }
            
            
        }
        
        
    }
    
    */
    
    //Update function
     override func update(_ currentTime: CFTimeInterval) {
    
        //updateHighScore()
    
    
    }
    

}
