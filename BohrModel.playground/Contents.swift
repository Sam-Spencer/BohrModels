// 
//  Bohr Model Generator
//
//  Created by Sam Spencer on 7/10/17.
//  Copyright © 2017 Samuel Spencer. All rights reserved.
//

import PlaygroundSupport
import SpriteKit

// Draw the scene view and present the Bohr Model
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 700))
sceneView.ignoresSiblingOrder = true
sceneView.backgroundColor = .clear

// Create the Bohr Model scene
let scene = BohrModelScene(size: sceneView.bounds.size)
scene.name = "BohrModelScene"
scene.atomicNumberForModel = 118

scene.verboseLogging = false
scene.scaleMode = .aspectFill

// Present the scene
sceneView.presentScene(scene)

// Get this playground rolling!
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true
