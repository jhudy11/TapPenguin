//
//  GameViewController.swift
//  tapPenguin
//
//  Created by Joshua Hudson on 11/26/16.
//  Copyright © 2016 com.ParanoidPenguinProductions. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
        
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false

        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
