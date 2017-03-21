//
//  GameScene.swift
//  Bee Adventure Game
//
//  Created by Joshua Randall on 2017-03-05.
//  Copyright © 2017 Josh/Matt/Jon. All rights reserved.
//

import SpriteKit
//import CoreGraphics
//import GameplayKit

class GameScene: SKScene {
    
    
    //Declared Variables
    var player = SKSpriteNode();
    
    var ground = SKSpriteNode();
    
       override func didMove(to view: SKView) {
        
        //Set up the Game Screen here for the background
        self.anchorPoint = CGPoint(x: 0.5, y: 1.0);
 
        createBackGrounds()

        
        
        //Create Player
        player = SKSpriteNode(imageNamed: "BeeGirl")
        self.addChild(player) // adding the ground to the scene
        player.name = "BeeGirl"
        player.zPosition = 1;
        player.size = CGSize(width: 60.0, height: 60.0)
        player.anchorPoint = CGPoint(x:player.frame.width / 2 - player.frame.width, y: self.frame.height / 2 )
        
        
    
        
    }
    
    
    //Update function
    override func update(_ currentTime: CFTimeInterval) {
        
        //Calling the function in update
        moveBackGrounds();
    }
    
    
    
    //Function for creating the backgrounds
    func createBackGrounds()
    {
        
        //Loop the different backgrounds
        for i in 0...3
        {
            let ground = SKSpriteNode(imageNamed: "LevelBg")
            //ground.zPosition = -1
            ground.name = "LevelBg"
            ground.size = CGSize(width: (self.scene?.size.width)!, height:1350)
            ground.anchorPoint = CGPoint(x:0.5, y:0.5)
            ground.position = CGPoint(x: CGFloat(i) * ground.size.width, y: -(self.frame.size.height / 2))
            
            
            self.addChild(ground) // adding the ground to the scene
            
        }
        
        
    }
    
    //Function for moving the different backgrounds
    func moveBackGrounds()
    {
     
        self.enumerateChildNodes(withName: "LevelBg", using:({
            (node,error) in
            
            node.position.x -= 3 // subtract the pos by 2
            
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 3
            }
            
        }))
    
        
    }
    

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Main Menu
        for touch in touches
        {
            let location = touch.location(in: self);
            
            //Moving the player on teh screen
            player.run(SKAction.moveTo(y: location.y, duration: 0.2))
            
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

    // Movement Code when player touches the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches
        {
            
            let location = touch.location(in: self);
            
            player.run(SKAction.moveTo(y: location.y, duration: 0.2))
            
        }
        
        
        
    }
    
    
    
    
    
}
