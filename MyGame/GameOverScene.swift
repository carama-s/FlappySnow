//
//  GameOverScene.swift
//  MyGame
//
//  Created by Stéphane on 03/12/2014.
//  Copyright (c) 2014 Stéphane. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, score: Int) {
        
        super.init(size: size)
        self.backgroundColor = SKColor.whiteColor()
        
        let labelScore = SKLabelNode(fontNamed: "Chalkduster")
        labelScore.text = String(score)
        labelScore.fontSize = 36
        labelScore.fontColor = SKColor.redColor()
        labelScore.position = CGPoint(x: size.width / 2, y: size.height - size.height / 4)
        self.addChild(labelScore)
        
        let labelGameOver = SKLabelNode(fontNamed: "Chalkduster")
        labelGameOver.text = "Game Over"
        labelGameOver.fontSize = 40
        labelGameOver.fontColor = SKColor.blackColor()
        labelGameOver.position = CGPoint(x: size.width / 2, y: size.height / 2)
        self.addChild(labelGameOver)
        
        let labelReplay = SKLabelNode(fontNamed: "Chalkduster")
        labelReplay.text = "Play again !"
        labelReplay.fontSize = 28
        labelReplay.fontColor = SKColor.blackColor()
        labelReplay.position = CGPoint(x: size.width / 2, y: size.height / 4)
        labelReplay.name = "labelRetry"
        self.addChild(labelReplay)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        let nodeTouch = self.nodeAtPoint(touchLocation)
        if (nodeTouch.name == "labelRetry") {
            let transition = SKTransition.flipHorizontalWithDuration(0.5)
            let gameScene = GameScene(size: size)
            gameScene.physicsWorld.contactDelegate = gameScene
            self.view?.presentScene(gameScene, transition: transition)
        }
    }
    
}