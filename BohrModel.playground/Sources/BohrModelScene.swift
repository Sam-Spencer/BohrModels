//
//  BohrModelScene.swift
//  Bohr Model Generator
//
//  Created by Sam Spencer on 7/10/17.
//  Copyright © 2017 Samuel Spencer. All rights reserved.
//

import SpriteKit

public class BohrModelScene: SKScene {
    
    public var atomicNumberForModel: Int = 1
    public var verboseLogging: Bool = true
    
    public override func didMove(to view: SKView) {
        let newAtom = drawBohrModel(atomicNumber: atomicNumberForModel)
        self.addChild(newAtom)
        
        self.backgroundColor = view.backgroundColor!
    }
    
    func drawBohrModel(atomicNumber: Int) -> SKNode {
        let path = Bundle.main.path(forResource: "AtomicShells", ofType: "plist")
        let dictionary = NSDictionary.init(contentsOfFile: path!)
        let atomShells: NSArray = dictionary!.object(forKey: NSString.init(string: "\(atomicNumber)")) as! NSArray
        if verboseLogging == true {
            print("Shell from requested atom: \(atomShells)")
        }
        
        // Define base radius of the nucleus and the initial shell
        let baseRadius = (self.size.width + self.size.height) * 0.01
        let shellBaseRadius = baseRadius * 2
        if verboseLogging == true {
            print("Base radius is \(baseRadius), and shell base radius is \(shellBaseRadius)")
        }
        
        // Draw the nucleus, or proton node
        let protonNode = SKShapeNode.init(circleOfRadius: baseRadius)
        protonNode.fillColor = UIColor.white
        protonNode.position = CGPoint.init(x:self.frame.midX, y:self.frame.midY)
        // CGPoint.init(x: 0, y: 0)
        // self.addChild(protonNode)
        
        // Now, using the retrieved data, create an orbital for each shell
        var shellNumber = 1
        for electronCount in atomShells {
            // Begin by calculating the radius of the current shell
            // The maximum number of shells to be drawn at any point is 8
            // The minimum number is 1
            let shellRadius = Double(shellBaseRadius) + (sqrt(Double(shellNumber)) * 100) + 5
            
            let orbitalNode = SKShapeNode.init(circleOfRadius: CGFloat(shellRadius))
            orbitalNode.fillColor = UIColor.clear
            orbitalNode.strokeColor = UIColor.white
            orbitalNode.lineWidth = 5
            orbitalNode.position = CGPoint.init(x: 0, y: 0)
            protonNode.addChild(orbitalNode)
            
            // Then get the electrons to add to the orbital by counting them
            let electrons = electronCount as! NSString
            let electronNumber = electrons.integerValue
            if verboseLogging == true {
                print("Shell \(shellNumber), \(electronNumber) electrons, \(shellRadius) radius")
            }
            
            // Calculate the correct spacing for the electrons in the current orbit
            let theta = ((Double.pi * 2) / Double(electronNumber))
            
            for currentElectronNumber in 1 ... electronNumber {
                if verboseLogging == true {
                    print("  Electron #\(currentElectronNumber)")
                }
                
                // Calculate the angle at which the current electron should be placed on its orbit
                // This allows for even spacing of electrons along their orbital paths
                let angle = (theta * Double(currentElectronNumber))
                
                // Create the electron object
                let electronNode = SKShapeNode.init(circleOfRadius: baseRadius * 0.5) // multiply by 0.00005 for to-scale rep.
                electronNode.fillColor = UIColor.white
                
                // To correctly position the electron, multiply cos / sin of its calculated position on orbital and the current shell radius
                electronNode.position = CGPoint.init(x: cos(angle) * shellRadius, y: sin(angle) * shellRadius)
                
                orbitalNode.addChild(electronNode)
            }
            
            shellNumber += 1
        }
        
        // Designate the appropriate spin duration
        let spinDuration = Double(10)
        protonNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: spinDuration)))
        
        return protonNode
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.isPaused == true) {
            self.isPaused = false
        } else {
            self.isPaused = true
        }
    }
    
    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
