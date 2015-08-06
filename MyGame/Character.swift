//
//  Character.swift
//  MyGame
//
//  Created by Stéphane on 03/12/2014.
//  Copyright (c) 2014 Stéphane. All rights reserved.
//

import Foundation
import SpriteKit

class Character {
    
    enum FlyingDirection {
        case Right
        case Left
    }
    
    var gameParent: GameScene
    var modelNode:SKSpriteNode
    var leftFlyTexturesAnimation = Array<SKTexture>()
    var rightFlyTexturesAnimation = Array<SKTexture>()
    var fireworksTexturesAnimation = Array<SKTexture>()

    var flyingDirection = FlyingDirection.Right

    init(gameParent: GameScene, positionX: CGFloat, positionY: CGFloat) {
        self.gameParent = gameParent
        self.modelNode = SKSpriteNode(texture: SKTexture(rect: CGRect(x: 0, y: 2/3, width: 0.2, height: 1/3), inTexture: SKTexture(imageNamed: "BirdSpriteRight")))
        self.modelNode.xScale = 0.3
        self.modelNode.yScale = 0.3
        self.modelNode.position = CGPoint(x: CGRectGetMidX(gameParent.frame), y: CGRectGetMidY(gameParent.frame))
        initArraysTexturesAnimations()
    }
    
    func initArraysTexturesAnimations() {

        let baseTextureRight = SKTexture(imageNamed: "BirdSpriteRight")
        
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.8, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.6, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.4, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.2, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.6, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.4, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.2, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.8, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.6, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.4, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.2, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        rightFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureRight))
        
        let baseTextureLeft = SKTexture(imageNamed: "BirdSpriteLeft")
        
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.2, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.4, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.6, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.8, y: 2/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.2, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.4, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.6, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.8, y: 0, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.2, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.4, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.6, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        leftFlyTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.8, y: 1/3, width: 0.2, height: 1/3), inTexture: baseTextureLeft))
        
        let baseTextureFireworks = SKTexture(imageNamed: "BirdFireworks")
        fireworksTexturesAnimation.append(SKTexture(rect: CGRect(x: 0.9, y: 6/7, width: 0.1, height: 1/7), inTexture: baseTextureFireworks))
        for (var j = 5.0; j >= 0.0; j = j - 1.0) {
            for (var i = 0.0; i < 1; i = i + 0.2) {
                fireworksTexturesAnimation.append(SKTexture(rect: CGRect(x: i, y: j / 7, width: 0.1, height: 1/7), inTexture: baseTextureFireworks))
            }
        }
    }
    
    func startLeftFlyAnimation()
    {
        let character_fly_animation = SKAction.animateWithTextures(leftFlyTexturesAnimation, timePerFrame: 0.07)
        let fly = SKAction.repeatActionForever(character_fly_animation)
        self.flyingDirection = FlyingDirection.Left
        self.modelNode.runAction(fly, withKey: "flying_left")
    }
    
    func startRightFlyAnimation()
    {
        let character_fly_animation = SKAction.animateWithTextures(rightFlyTexturesAnimation, timePerFrame: 0.07)
        let fly = SKAction.repeatActionForever(character_fly_animation)
        self.flyingDirection = FlyingDirection.Right
        self.modelNode.runAction(fly, withKey: "flying_right")
    }
    
    func startFireworksAnimation()
    {
        let character_fireworks_animation = SKAction.animateWithTextures(fireworksTexturesAnimation, timePerFrame: 0.05)
        let fireworks = SKAction.sequence([character_fireworks_animation])
        self.modelNode.runAction(fireworks, completion: {() -> Void in
            let gameOverScene = GameOverScene(size: self.gameParent.size, score: self.gameParent.score)
            self.gameParent.view?.presentScene(gameOverScene, transition: nil)
        })
    }
    
    func setPhysics() {
        let physicsBody = SKPhysicsBody(rectangleOfSize: self.modelNode.size)
        physicsBody.usesPreciseCollisionDetection = true
        physicsBody?.affectedByGravity = false
        physicsBody?.dynamic = false
        
        self.modelNode.physicsBody = physicsBody
        self.modelNode.physicsBody?.categoryBitMask = self.gameParent.CATEGORY_CHARACTER
        physicsBody.collisionBitMask = self.gameParent.CATEGORY_SNOWFLAKE
        physicsBody.contactTestBitMask = self.gameParent.CATEGORY_SNOWFLAKE
    }
    
    func addToNode() {
        self.gameParent.addChild(self.modelNode)
    }
}