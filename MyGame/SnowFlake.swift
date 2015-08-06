//
//  SnowFlake.swift
//  MyGame
//
//  Created by Stéphane on 03/12/2014.
//  Copyright (c) 2014 Stéphane. All rights reserved.
//

import Foundation
import SpriteKit

class SnowFlake {
    var gameParent: GameScene
    var modelNode:SKSpriteNode
    var snowFlakeImageName:String
    
    init(gameParent: GameScene, positionX: CGFloat, positionY: CGFloat) {
        self.gameParent = gameParent
        
        let choice = self.gameParent.randomInt(1, max: 6)
        let size = self.gameParent.randomInt(20, max: 35)
        
        self.snowFlakeImageName = "SnowFlake-" + String(choice)
        self.modelNode = SKSpriteNode(imageNamed: snowFlakeImageName)
        self.modelNode.size = CGSize(width: size, height: size)
        self.modelNode.position = CGPoint(x: positionX, y: positionY)
    }
    
    func addToNode() {
        self.gameParent.addChild(self.modelNode)
    }
    
    func setPhysics() {
        let physicsBody = SKPhysicsBody(rectangleOfSize: self.modelNode.size)
        physicsBody.usesPreciseCollisionDetection = true
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = true
        
        self.modelNode.physicsBody = physicsBody
        self.modelNode.physicsBody?.categoryBitMask = self.gameParent.CATEGORY_SNOWFLAKE
        physicsBody.collisionBitMask = self.gameParent.CATEGORY_CHARACTER | self.gameParent.CATEGORY_SNOWFLAKE
        physicsBody.contactTestBitMask = self.gameParent.CATEGORY_CHARACTER | self.gameParent.CATEGORY_SNOWFLAKE
    }
    
    func setActions() {
        var randomDurationMove = NSTimeInterval(self.gameParent.randomInt(5, max: 8))
        let moveFall = SKAction.moveToY((0 - self.modelNode.size.height / 2), duration: randomDurationMove)
        self.modelNode.runAction(moveFall, completion: { () -> Void in
            self.modelNode.removeFromParent()
            self.gameParent.score = self.gameParent.score + (Int(self.modelNode.size.width))
            self.gameParent.labelScore.text = String(self.gameParent.score)
        })
    }
}