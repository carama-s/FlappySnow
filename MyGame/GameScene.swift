//
//  GameScene.swift
//  MyGame
//
//  Created by Stéphane on 02/12/2014.
//  Copyright (c) 2014 Stéphane. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let CATEGORY_CHARACTER: UInt32 = 0x1 << 0
    let CATEGORY_SNOWFLAKE: UInt32 = 0x1 << 1
    
    var character:Character?
    var labelScore = SKLabelNode()
    var score = 0

    override func didMoveToView(view: SKView) {
        setUpBackgroundImage()
        setUpCharacterNode()
        setUpScore()
    }
    
    func setUpBackgroundImage() {
        let background = SKSpriteNode(imageNamed: "Background")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.size = self.size
        self.addChild(background)
    }
    
    func setUpCharacterNode() {
        character = Character(gameParent: self, positionX: CGRectGetMidX(self.frame), positionY: 100)
        character?.addToNode()
        character?.startRightFlyAnimation()
        character?.setPhysics()
    }
    
    func setUpScore() {
        self.labelScore.text = String(self.score)
        self.labelScore.fontSize = 32
        self.labelScore.fontName = "Chalkduster"
        self.labelScore.fontColor = UIColor.whiteColor()
        self.labelScore.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - 50);
        self.addChild(self.labelScore)
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let categoryA = contact.bodyA.categoryBitMask
        let categoryB = contact.bodyB.categoryBitMask
        
        if (categoryA & CATEGORY_SNOWFLAKE != 0) && (categoryB & CATEGORY_SNOWFLAKE != 0) // two snowflakes collision
        {}
        else if ((categoryA & CATEGORY_SNOWFLAKE != 0 && categoryB & CATEGORY_CHARACTER != 0)
            || (categoryA & CATEGORY_CHARACTER != 0) && (categoryB & CATEGORY_SNOWFLAKE != 0)) // snowflake + character collision
        {
            if (categoryA & CATEGORY_SNOWFLAKE != 0) {
                contact.bodyA.node?.removeFromParent()
            }
            else {
                contact.bodyB.node?.removeFromParent()
            }
            self.character?.startFireworksAnimation()
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
                
        if (touchLocation.x > self.character?.modelNode.position.x && self.character?.flyingDirection == Character.FlyingDirection.Left) {
            self.character?.startRightFlyAnimation()
        }
        else if (touchLocation.x < self.character?.modelNode.position.x && self.character?.flyingDirection == Character.FlyingDirection.Right) {
            self.character?.startLeftFlyAnimation()
        }
        
        var actionMove = SKAction.moveTo(CGPointMake(touchLocation.x, touchLocation.y), duration: 0.5)
        self.character?.modelNode.runAction(actionMove)
    }
    
    override func update(currentTime: CFTimeInterval) {
        if (arc4random() % 1000 > (970 - self.score / 500 )) {
            createSnowFlake()
        }
    }
    
    func createSnowFlake() {
        var randomPosX = randomInt(10, max: Int(self.size.width - 10))
        var snowFlake = SnowFlake(gameParent: self, positionX: CGFloat(randomPosX), positionY: CGRectGetMaxY(self.frame))
        snowFlake.addToNode()
        snowFlake.setActions()
        snowFlake.setPhysics()
    }
}
