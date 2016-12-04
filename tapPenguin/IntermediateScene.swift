//
//  IntermediateScene.swift
//  tapPenguin
//
//  Created by Joshua Hudson on 12/3/16.
//  Copyright © 2016 com.ParanoidPenguinProductions. All rights reserved.
//

import SpriteKit
import GameplayKit

//Declared in a global position to allow for use in GameOverScene

class IntermediateScene: SKScene {
    
    
    let scoreLabel = SKLabelNode(fontNamed: "Pusab")
    
    let playCorrectSoundEffect = SKAction.playSoundFileNamed("Correct.wav", waitForCompletion: false)
    let playGameOverSoundEffect = SKAction.playSoundFileNamed("GameOverSound.wav", waitForCompletion: false)
    
    let gameArea: CGRect
    
    override init(size: CGSize) {
        
        //Creates gameArea for different size devices
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    override func didMove(to view: SKView) {
        
        //Resets the score after a new game is started within the same game session
        scoreNumber = 0
        
        //Setting up the background
        let background = SKSpriteNode(imageNamed: "DiscsBackground")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        
        //Sets the background as the furthest back in the view stack
        background.zPosition = 0
        self.addChild(background)
        
        let disc = SKSpriteNode(imageNamed: "Disc2")
        disc.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        disc.zPosition = 2
        disc.name = "discObject"
        self.addChild(disc)
        
        scoreLabel.fontSize = 250
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.white
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        self.addChild(scoreLabel)
        
    }
    
    func spawnNewDisc() {
        
        var randomImageNumber = arc4random()%4
        randomImageNumber += 1
        
        //Random disc image
        let disc = SKSpriteNode(imageNamed: "Disc\(randomImageNumber)")
        disc.zPosition = 2
        disc.name = "discObject"
        
        let randomX = random(min: gameArea.minX + disc.size.width/2,
                             max: gameArea.maxX - disc.size.width/2)
        
        let randomY = random(min: gameArea.minY + disc.size.height/2,
                             max: gameArea.maxY - disc.size.height/2)
        
        disc.position = CGPoint(x: randomX, y: randomY)
        self.addChild(disc)
        
        //Shrink the disc over a timeframe of 3 sec
        disc.run(SKAction.sequence([
            SKAction.scale(to: 0, duration: 2),
            playGameOverSoundEffect,
            SKAction.run(runGameOver)
            ]))
    }
    
    func spawnBombDisc() {
        
        let randomCountNumber = arc4random()%10
        
        if randomCountNumber == 0 {
            
            let bomb = SKSpriteNode(imageNamed: "cartoonBomb")
            bomb.zPosition = 1
            bomb.name = "bombObject"
            
            let randomX = random(min: gameArea.minX + bomb.size.width/2,
                                 max: gameArea.maxX - bomb.size.width/2)
            
            let randomY = random(min: gameArea.minY + bomb.size.height/2,
                                 max: gameArea.maxY - bomb.size.height/2)
            
            bomb.position = CGPoint(x: randomX, y: randomY)
            self.addChild(bomb)
            
            //Shrink the disc over a timeframe of 1.25 sec
            /* bomb.run(SKAction.sequence([
             SKAction.scale(to: 0, duration: 1.25),
             playGameOverSoundEffect,
             SKAction.run(runGameOver)
             ]))
             */
            
            bomb.run(SKAction.sequence([
                SKAction.scale(to: 0, duration: 1.25)
                ]))
        }
    }
    
    func runGameOver() {
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fade(withDuration: 0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "discObject" {
                
                // Remove the disc's name so that the object cannot be tapped again as it is fading out
                tappedNode.name = ""
                
                //Stops a tapped disc from triggering the runGameOver method
                tappedNode.removeAllActions()
                
                //Fade the disc out
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                    ]))
                
                self.run(playCorrectSoundEffect)
                
                spawnNewDisc()
                spawnBombDisc()
                
                scoreNumber += 2
                scoreLabel.text = "\(scoreNumber)"
                
                if scoreNumber == 2 || scoreNumber == 10 || scoreNumber == 100 || scoreNumber == 250 || scoreNumber == 400 || scoreNumber == 600 || scoreNumber == 1000 {
                    
                    spawnNewDisc()
                    spawnBombDisc()
                }
            }
            
            if nameOfTappedNode == "bombObject" {
                
                runGameOver()
            }
        }
    }
}
