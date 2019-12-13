//
//  InterfaceController.swift
//  CrownFortune WatchKit Extension
//
//  Created by 土居将史 on 2019/07/28.
//  Copyright © 2019 土居将史. All rights reserved.
//

import WatchKit
import Foundation
import SpriteKit

class InterfaceController: WKInterfaceController, WKCrownDelegate{

    @IBOutlet weak var countRotenLabel: WKInterfaceLabel!//インターフェース状にcrownを回した数を表示
    @IBOutlet weak var handleImage: WKInterfaceImage!
    
    final let MAX_ROTATION_VALUE = 73.0
    final let MIN_ROTATION_VALUE = 0.0
    
    var countRotation:Double = 1.0
    var oldCountValue:Double = 0.0
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        let monitoringCrown = self.crownSequencer //crown関連のイベントを監視するインスタンスの取得
        monitoringCrown.delegate = self
        monitoringCrown.focus();//crownインターフェースにフォーカスし、値の取得を開始する.
        // Configure interface objects here.
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    ///
    /// クラウンを操作した際に動くメソッド
    /// - Parameters:
    ///     - _: Digital Crownを変更したかの真理値
    ///     - rotationalDelta: Digital Crownを前回の変更からいくつまわしたかの判定
    /// - Returns: nothing
    func crownDidRotate(_: WKCrownSequencer?, rotationalDelta: Double){
        countRotation += floor(rotationalDelta*100)
        if countRotation >= MAX_ROTATION_VALUE {
            countRotation = 1.0
        } else if countRotation <= MIN_ROTATION_VALUE {
            countRotation = 72.0
        }
        oldCountValue = countRotation
        spinHandle(rotationValue: countRotation, beforeRotationValue: oldCountValue)
    }

    func crownDidBecomeIdle(_: WKCrownSequencer?) {
        print("crownDidBecomeIdle")
    }
    
    func spinHandle(rotationValue: Double, beforeRotationValue: Double) {
        print("handleImage\(Int(rotationValue))")
        let imageName:String? = "handleImage\(Int(rotationValue))"
        handleImage.setImageNamed(imageName)
        countRotenLabel.setText(String("\(countRotation)"))
    }
}

