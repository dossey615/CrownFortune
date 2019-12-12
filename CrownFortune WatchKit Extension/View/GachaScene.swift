//
//  AnimationScene.swift
//  CrownFortune
//
//  Created by 土居将史 on 2019/08/26.
//  Copyright © 2019 土居将史. All rights reserved.
//

import SpriteKit

extension SKScene{
    /*
    度数からラジアンに変換するメソッド
    */
    func DegreeToRadian(Degree : Double!)-> CGFloat{
        return CGFloat(Degree) / CGFloat(180.0 * M_1_PI)
    }
}

class GachaScene: SKScene {
    
    fileprivate var handle : SKSpriteNode?
    private var rotateAction :SKAction!
    private var rect : SKShapeNode!
    
    class func newHandleScene() -> GachaScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GachaScene") as? GachaScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
}
