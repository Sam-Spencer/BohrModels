//#-hidden-code
//  Bohr Model Generator
//
//  Created by Sam Spencer on 7/10/17.
//  Copyright © 2017 Samuel Spencer. All rights reserved.
//#-end-hidden-code
/*:
 Neils Bohr proposed the Bohr Model of the Atom in 1915. It is a planetary model in which electrons orbit around the nucleus of the atom at various energy levels. The model has been superceded by the Electron Cloud Model, based on quantum mechanics, but still provides a useful look at how electrons separate themselves by energy.
 
 **In this playground you'll be able to create Bohr Models for all 118 known elements.**
 
 Get started by changing some properties of the Bohr Model `scene`. Then, run the playground.
 Try modifying:
 * `Int`: `atomicNumberForModel`
 */

//#-hidden-code
import PlaygroundSupport
import SpriteKit

//: Draw the scene view and present the Bohr Model
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 700))
sceneView.ignoresSiblingOrder = true
sceneView.backgroundColor = .clear

// Create the Bohr Model scene
let scene = BohrModelScene(size: sceneView.bounds.size)
scene.name = "BohrModelScene"
//#-end-hidden-code
scene.atomicNumberForModel = /*#-editable-code*/3/*#-end-editable-code*/
//#-hidden-code
scene.verboseLogging = false
scene.scaleMode = .aspectFill

// Present the scene
sceneView.presentScene(scene)

// Get this playground rolling!
// PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
// PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true
//#-end-hidden-code
