//
//  GameOverScene.swift
//  tapPenguin
//
//  Created by Joshua Hudson on 11/26/16.
//  Copyright © 2016 com.ParanoidPenguinProductions. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    let clickSound = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "DiscsBackground")
        background.size = self.size
        background.zPosition = 0
        
        //Position the background in the center of the screen
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "Pusab")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 140
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let finalScoreLabel = SKLabelNode(fontNamed: "Pusab")
        finalScoreLabel.text = "Score: \(scoreNumber)"
        finalScoreLabel.fontSize = 70
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        finalScoreLabel.fontColor = SKColor.white
        finalScoreLabel.zPosition = 1
        self.addChild(finalScoreLabel)
        
        //Load and save high score
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if scoreNumber > highScoreNumber {
            highScoreNumber = scoreNumber
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 70
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(highScoreLabel)
        
        let restartLabel = SKLabelNode(fontNamed: "Pusab")
        restartLabel.text = "Play Again"
        restartLabel.fontSize = 75
        restartLabel.fontColor = SKColor.white
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        restartLabel.name = "restartButton"
        self.addChild(restartLabel)
        
        let exitLabel = SKLabelNode(fontNamed: "Pusab")
        exitLabel.text = "Exit"
        exitLabel.fontSize = 75
        exitLabel.color = SKColor.white
        exitLabel.zPosition = 1
        exitLabel.position = CGPoint(x: self.size.width/2, y: self.size.width*0.2)
        exitLabel.name = "exitButton"
        self.addChild(exitLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "restartButton" {
                
                self.run(clickSound)
                
                let sceneToMoveTo = DifficultyMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "exitButton" {
                
                self.run(clickSound)
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
}














