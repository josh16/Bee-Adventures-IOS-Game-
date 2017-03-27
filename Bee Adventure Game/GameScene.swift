//
//  GameScene.swift
//  Bee Adventure Game
//
//  Created by Joshua Randall on 2017-03-05.
//  Copyright © 2017 Josh/Matt/Jon. All rights reserved.
//

import SpriteKit
import GameplayKit
//import CoreGraphics


class GameScene: SKScene {

    //Declared Variables
    var player = SKSpriteNode();
    
    //Old background
    //var ground = SKSpriteNode();
    
    //New Background
    var bg : SKSpriteNode?
    var bg2 : SKSpriteNode?
    
   
    
    override func didMove(to view: SKView) {
        
        //new Background as new node
        bg = self.childNode(withName: "Bg") as! SKSpriteNode?
        bg2 = self.childNode(withName: "Bg2") as! SKSpriteNode?
        
        
        
        //Create Player
        player = SKSpriteNode(imageNamed: "BeeGirl")
        player.name = "BeeGirl"
        player.zPosition = 2 // The Layer the player is on
        //player.position = CGPoint(x: -10.0, y: 0.0)
        player.size = CGSize(width: 70.0, height: 70.0) //Size of
        player.anchorPoint = CGPoint(x: 2.2, y:0.0 )

         self.addChild(player) // adding the player to the scene
    }
    
    
    //Update function
    override func update(_ currentTime: CFTimeInterval) {
        
        //Calling the function in update
       MoveBackground()
        
      
        /*
        
        let newPos = (bg?.position.x)! + -0.8
        print(bg?.position.x)
        bg?.position.x = newPos
        print(newPos)
    
    */
    
    }
    
 
    
    func MoveBackground()
    {
       
        
        self.enumerateChildNodes(withName: "Bg" , using:({
            (node,error) in
            
            node.position.x -= 3 // subtract the pos by 2
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 2
            }
            
        }))
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Main Menu
        for touch in touches
        {
            let location = touch.location(in: self);
            
            //Moving the player on the screen
            player.run(SKAction.moveTo(y: location.y, duration: 0.2))
            
     
            
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
