//
//  DifficultyMenuScene.swift
//  tapPenguin
//
//  Created by Joshua Hudson on 12/3/16.
//  Copyright © 2016 com.ParanoidPenguinProductions. All rights reserved.
//

import Foundation
import SpriteKit

class DifficultyMenuScene: SKScene {
    
    let clickSound = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "DiscsBackground")
        background.size = self.size
        background.zPosition = 0
        
        //Position the background in the center of the screen
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameTitleLabel1 = SKLabelNode(fontNamed: "Pusab")
        gameTitleLabel1.text = "Shrinking"
        gameTitleLabel1.fontSize = 90
        gameTitleLabel1.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameTitleLabel1.fontColor = SKColor.white
        gameTitleLabel1.zPosition = 1
        self.addChild(gameTitleLabel1)
        
        let gameTitleLabel2 = SKLabelNode(fontNamed: "Pusab")
        gameTitleLabel2.text = "Discs"
        gameTitleLabel2.fontSize = 250
        gameTitleLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        gameTitleLabel2.fontColor = SKColor.white
        gameTitleLabel2.zPosition = 1
        self.addChild(gameTitleLabel2)
        
        let gameByLabel = SKLabelNode(fontNamed: "Pusab")
        gameByLabel.text = "Paranoid Penguin Productions Presents"
        gameByLabel.fontSize = 30
        gameByLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.95)
        gameByLabel.fontColor = SKColor.white
        gameByLabel.zPosition = 1
        self.addChild(gameByLabel)
        
        let howToPlayLabel = SKLabelNode(fontNamed: "Pusab")
        howToPlayLabel.text = "Tap The Dics Before They Vanish"
        howToPlayLabel.fontSize = 40
        howToPlayLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.08)
        howToPlayLabel.fontColor = SKColor.white
        howToPlayLabel.zPosition = 1
        self.addChild(howToPlayLabel)
        
        let creditsLabel = SKLabelNode(fontNamed: "Pusab")
        creditsLabel.text = "Tap For Full Credits"
        creditsLabel.fontSize = 40
        creditsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.04)
        creditsLabel.fontColor = SKColor.white
        creditsLabel.zPosition = 1
        creditsLabel.name = "creditButton"
        self.addChild(creditsLabel)
        
        let beginnerLabel = SKLabelNode(fontNamed: "Pusab")
        beginnerLabel.text = "Beginner"
        beginnerLabel.fontSize = 100
        beginnerLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        beginnerLabel.fontColor = SKColor.white
        beginnerLabel.zPosition = 1
        beginnerLabel.name = "beginnerButton"
        self.addChild(beginnerLabel)
        
        let intermediateLabel = SKLabelNode(fontNamed: "Pusab")
        intermediateLabel.text = "Intermediate"
        intermediateLabel.fontSize = 100
        intermediateLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.35)
        intermediateLabel.fontColor = SKColor.white
        intermediateLabel.zPosition = 1
        intermediateLabel.name = "intermediateButton"
        self.addChild(intermediateLabel)
        
        let expertLabel = SKLabelNode(fontNamed: "Pusab")
        expertLabel.text = "Expert"
        expertLabel.fontSize = 100
        expertLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        expertLabel.fontColor = SKColor.white
        expertLabel.zPosition = 1
        expertLabel.name = "expertButton"
        self.addChild(expertLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "beginnerButton" {
                
                self.run(clickSound)
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "intermediateButton" {
                
                self.run(clickSound)
                
                let sceneToMoveTo = IntermediateScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
            
            if tappedNodeName == "expertButton" {
                
                self.run(clickSound)
                
                let sceneToMoveTo = ExpertScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
}












