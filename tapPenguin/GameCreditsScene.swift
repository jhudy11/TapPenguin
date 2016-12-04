//
//  GameCreditsScene.swift
//  tapPenguin
//
//  Created by Joshua Hudson on 11/26/16.
//  Copyright © 2016 com.ParanoidPenguinProductions. All rights reserved.
//

import Foundation
import SpriteKit

class GameCreditsScene: SKScene {
    
    let clickSound = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)
    
    /*
 
     Credits:
     Code: Matt Heaney
     Graphic: Aaron Negus
     Font: Pusab by Bagel and Co (downloaded from DaFont.com)
     Sound Effects are Public Domain
 */

    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "DiscsBackground")
        background.size = self.size
        background.zPosition = 0
        
        //Position the background in the center of the screen
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let creditLabel = SKLabelNode(fontNamed: "Pusab")
        creditLabel.text = "Credits"
        creditLabel.fontSize = 90
        creditLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.8)
        creditLabel.fontColor = SKColor.white
        creditLabel.zPosition = 1
        self.addChild(creditLabel)
        
        let mattHeaneyLabel = SKLabelNode(fontNamed: "Pusab")
        mattHeaneyLabel.text = "Source Code: Matt Heaney"
        mattHeaneyLabel.fontSize = 40
        mattHeaneyLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.7)
        mattHeaneyLabel.fontColor = SKColor.white
        mattHeaneyLabel.zPosition = 1
        self.addChild(mattHeaneyLabel)
        
        let aaronNegusLabel = SKLabelNode(fontNamed: "Pusab")
        aaronNegusLabel.text = "Graphic: Aaron Negus"
        aaronNegusLabel.fontSize = 40
        aaronNegusLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        aaronNegusLabel.fontColor = SKColor.white
        aaronNegusLabel.zPosition = 1
        self.addChild(aaronNegusLabel)
        
        let fontLabel = SKLabelNode(fontNamed: "Pusab")
        fontLabel.text = "TFont: Pusab by Bagel and Co"
        fontLabel.fontSize = 40
        fontLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.5)
        fontLabel.fontColor = SKColor.white
        fontLabel.zPosition = 1
        self.addChild(fontLabel)
        
        let fontLabel2 = SKLabelNode(fontNamed: "Pusab")
        fontLabel2.text = "(downloaded from DaFont.com)"
        fontLabel2.fontSize = 40
        fontLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.4)
        fontLabel2.fontColor = SKColor.white
        fontLabel2.zPosition = 1
        self.addChild(fontLabel2)
        
        let soundEffectsLabel = SKLabelNode(fontNamed: "Pusab")
        soundEffectsLabel.text = "Sound Effects are Public Domain"
        soundEffectsLabel.fontSize = 40
        soundEffectsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        soundEffectsLabel.fontColor = SKColor.white
        soundEffectsLabel.zPosition = 1
        soundEffectsLabel.name = "creditButton"
        self.addChild(soundEffectsLabel)
        
        let backLabel = SKLabelNode(fontNamed: "Pusab")
        backLabel.text = "Main Menu"
        backLabel.fontSize = 60
        backLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.08)
        backLabel.fontColor = SKColor.white
        backLabel.zPosition = 1
        backLabel.name = "backButton"
        self.addChild(backLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "backButton" {
                
                self.run(clickSound)
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.2)
                self.view?.presentScene(sceneToMoveTo, transition: sceneTransition)
            }
        }
    }
}
