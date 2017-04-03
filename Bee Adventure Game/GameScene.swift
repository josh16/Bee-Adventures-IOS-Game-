//
//  GameScene.swift
//  Bee Adventure Game
//
//  Created by Joshua Randall on 2017-03-05.
//  Copyright © 2017 Josh/Matt/Jon. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics


class GameScene: SKScene {

    //Declared Variables
    var player = SKSpriteNode();
    var enemy = SKSpriteNode();
    
    //Array code
    //var bgArray = [SKSpriteNode] ()// Array of backgrounds (Sprites)

    
    //Old background
    //var ground = SKSpriteNode();
    
    //New Background
    //var bg : SKSpriteNode?
    //var bg2 : SKSpriteNode?
    
   
    var bg = SKSpriteNode(imageNamed:"LevelBg")
    var bg2 = SKSpriteNode(imageNamed:"LevelBg")
    
    
    override func didMove(to view: SKView) {
        
        //new Background as new node
       //bg = self.childNode(withName: "Bg") as! SKSpriteNode?
        //bg2 = self.childNode(withName: "Bg2") as! SKSpriteNode?
        
        
        
        
        bg.anchorPoint = CGPoint(x: 0, y: 0)
        bg.position = CGPoint(x: -200, y: -300)
        bg.size = CGSize(width: 1000, height: 800)
        bg.zPosition = 2
        addChild(bg)
        
        
        bg2.anchorPoint = CGPoint(x: 0, y: 0)
        bg2.position = CGPoint(x: bg2.size.width-1, y: -300)
        bg2.size = CGSize(width: 1000, height: 800)
        bg2.zPosition = 2
        addChild(bg2)
        
        
        //Game Border
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        
        /*
        
        //Adding the backgrounds to the array
        bgArray.append((self.childNode(withName: "Bg") as! SKSpriteNode?)!)
        bgArray.append((self.childNode(withName: "Bg2") as! SKSpriteNode?)!)

        */
        
        
        //Create Player
        player = SKSpriteNode(imageNamed: "BeeGirl")
        player.name = "BeeGirl"
        player.zPosition = 3 // The Layer the player is on
        player.size = CGSize(width: 70.0, height: 70.0) //Size of
        player.anchorPoint = CGPoint(x: 2.2, y:0.0 )

        //Physics body for the player
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize( width:player.size.width, height: player.size.width))
       
        player.physicsBody?.affectedByGravity = false
        
        
        
        
        
         self.addChild(player) // adding the player to the scene
    }
    
    
    //Update function
    override func update(_ currentTime: CFTimeInterval) {
        
       //MoveBackground()
       
       
        //Moving the Background Sprites
        bg.position = CGPoint(x:bg.position.x-5 , y:bg.position.y)
        bg2.position = CGPoint(x:bg.position.x-5 , y:bg2.position.y)
      
        //Checks to see if it loops
        if bg.position.x < -bg.size.width {
            bg.position = CGPoint(x: bg2.position.x+bg2.size.width, y: bg.position.y)
            
        }
        
        if bg2.position.x < -bg2.size.width {
            bg2.position = CGPoint(x: bg.position.x+bg.size.width, y: bg2.position.y)
            
        }

        
        
        
        /*
        
        let newPos = (bg?.position.x)! + -0.8
        print(bg?.position.x)
        bg?.position.x = newPos
        print(newPos)
    
    */
    
    }
    

    
    
    //Spawn Enemy Function (Doesn't work yet)
    func SpawnEnemy()
    {
       //let spawn = SKAction(
    }
    
    
    
    //Code for getting the background to move
    func MoveBackground()
    {
       
        
       /*
        
        self.enumerateChildNodes(withName: "Bg" , using:({
            (node,error) in
            
            node.position.x -= 3 // subtract the pos by 2
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 0.5
            }
            
        }))
        
        self.enumerateChildNodes(withName: "Bg2" , using:({
            (node,error) in
            
            node.position.x -= 3 // subtract the pos by 2
            if node.position.x < -((self.scene?.size.width)!) {
                node.position.x += (self.scene?.size.width)! * 0.5
            }
            
        }))

    
    
    */
    
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
