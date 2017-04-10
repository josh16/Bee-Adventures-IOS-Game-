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
import AVFoundation //audio library, SKACTION.play name


class GameScene: SKScene,SKPhysicsContactDelegate {

    //SpriteNode Variables
    var player = SKSpriteNode();
    var enemy = SKSpriteNode();
    
    //Each category will be associated with a specific value
    struct PhysicsCategory
    {
        static let PLAYER :UInt32 = 0x1 << 0
        static let ENEMY  :UInt32 = 0x1 << 1
        //static let WALL   :UInt32  = 0x1 << 2
    }
    
  
    //Audio Reference Variables
    
    
    //Score Reference Variables
    
    
    //HighScore Reference Variables
    
    
    
    //Background SpriteNbodes
    var bg = SKSpriteNode(imageNamed:"LevelBg")
    var bg2 = SKSpriteNode(imageNamed:"LevelBg")
    

    //Did move function
    override func didMove(to view: SKView) {
        
    
        //background 1 anchor point
        bg.anchorPoint = CGPoint(x: 0, y: 0)
        bg.position = CGPoint(x: -200, y: -300)
        bg.size = CGSize(width: 1000, height: 800)
        bg.zPosition = 2
        addChild(bg)
        
        //background 2 anchor point
        bg2.anchorPoint = CGPoint(x: 0, y: 0)
        bg2.position = CGPoint(x: bg2.size.width-1, y: -300)
        bg2.size = CGSize(width: 1000, height: 800)
        bg2.zPosition = 2
        addChild(bg2)
        
        
        //Game Border
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
      
        //Delegates all the contacts that go in in the view
        self.physicsWorld.contactDelegate = self
        
        //Contact Function for physics
        func didBeginContact(contact:SKPhysicsContact)
        {
            let firstBody = contact.bodyA.node as! SKSpriteNode
            let secondBody = contact.bodyB.node as! SKSpriteNode
        
            
            if((firstBody.name == "Enemy") && (secondBody.name == "Player"))
            {
                collisionEnemy(enemy: firstBody, player:secondBody)
                
            }
            else if ((firstBody.name == "Player") && (secondBody.name == "Enemy"))
            {
                collisionEnemy(enemy:secondBody, player: firstBody)
            }
        }
        
        
        //EnemyCollision
        func collisionEnemy(enemy:SKSpriteNode,player:SKSpriteNode)
        {
            enemy.physicsBody?.affectedByGravity = true
            enemy.physicsBody?.isDynamic = true
            enemy.physicsBody?.mass = 4.0 // how fast the enemy will drop.
            player.physicsBody?.mass = 4.0
        }
            
         
        
        
        //Create the Player
        player = SKSpriteNode(imageNamed: "BeeGirl")
        player.name = "BeeGirl"
        player.zPosition = 3 // The Layer the player is on
        player.size = CGSize(width: 70.0, height: 70.0) //Size of Player
        player.anchorPoint = CGPoint(x: 2.2, y:0.0 )

        //Physics body for the player
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize( width:player.size.width, height: player.size.width))
       
      //Physics Contact Code
        player.physicsBody?.categoryBitMask = PhysicsCategory.PLAYER
        player.physicsBody?.collisionBitMask = PhysicsCategory.ENEMY
        player.physicsBody?.contactTestBitMask = PhysicsCategory.ENEMY
        player.name = "Player"
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.isDynamic = false;
        
        
        
        
         self.addChild(player) // adding the player to the scene
    }
    
    
    //Spawn Interval for the enemy character
    //Time interval of last Spawn
    var lastSpawn: CFTimeInterval=0
    
    //Time interval for enemy to spawn
    var interval:CFTimeInterval = 5
   
    //Update function
    override func update(_ currentTime: CFTimeInterval) {
       
        MoveBackground()
        
        //Reference to Enemy Spawn
        print("current:\(currentTime), last: \(lastSpawn) \(currentTime-lastSpawn)\n")
        
        if currentTime-lastSpawn>interval{
            print("current:\(currentTime), last: \(lastSpawn)\n")
            SpawnEnemy()
            lastSpawn = currentTime
            interval = CFTimeInterval( arc4random_uniform(5) )
        }
       
    }
    

    
    
    //Spawn Enemy Function
    func SpawnEnemy()
    {
        //Object pooling maybe?
        let Enemy = SKSpriteNode(imageNamed:"bird.png");
        Enemy.zPosition = 3
        Enemy.size = CGSize(width: 70, height: 70)
        
        let Min = self.size.width - 100
        let Max = self.size.width + 100
        let spawnPoint = UInt32(Max-Min) // Spawn Range
        Enemy.position = CGPoint(x: (view?.frame.width)!/2, y: CGFloat(arc4random_uniform(spawnPoint)))
        
        print(spawnPoint)//debug
        
        //Method for enemy to spawn forever
        Enemy.run(SKAction.repeatForever( SKAction.moveBy(x: -50, y: 0, duration: 1)))
        
        self.addChild(Enemy)
        
         //*Need a method to destroy the enemy overtime
        
        
        
        //Physics
        enemy.physicsBody = SKPhysicsBody(rectangleOf: CGSize( width:enemy.size.width, height: enemy.size.width))
        enemy.physicsBody?.categoryBitMask = PhysicsCategory.ENEMY
        enemy.physicsBody?.contactTestBitMask = PhysicsCategory.PLAYER
        enemy.physicsBody?.collisionBitMask = PhysicsCategory.PLAYER
        enemy.physicsBody?.isDynamic = false
        enemy.physicsBody?.affectedByGravity = false
        enemy.name = "Enemy"
        
    }
    
    
    
    //Move Background function
    func MoveBackground()
    {
       
        //Checks to see if it loops
        if bg.position.x < -bg.size.width {
            bg.position = CGPoint(x: bg2.position.x+bg2.size.width, y: bg.position.y)
            
        }
        
        if bg2.position.x < -bg2.size.width {
            bg2.position = CGPoint(x: bg.position.x+bg.size.width, y: bg2.position.y)
            
        }

       
        //Moving the Background Sprites
        bg.position = CGPoint(x:bg.position.x-5 , y:bg.position.y)
        bg2.position = CGPoint(x:bg.position.x-5 , y:bg2.position.y)
        
        
    }
    
    //Touches Began Function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Main Menu reference
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

    //Touches Moved function
    // Movement Code when player touches the screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches
        {
        
            let location = touch.location(in: self);
            
            player.run(SKAction.moveTo(y: location.y, duration: 0.2))
            
        }
        
    }

}
