//
//  InterfaceController.swift
//  CrownFortune WatchKit Extension
//
//  Created by 土居将史 on 2019/07/28.
//  Copyright © 2019 土居将史. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController, WKCrownDelegate{

    @IBOutlet weak var countRotenLabel: WKInterfaceLabel!//インターフェース状にcrownを回した数を表示
    @IBOutlet weak var handleImage: WKInterfaceImage!
    @IBOutlet weak var gachaImage: WKInterfaceImage!
    
    let crownValue = CrownValue()
    
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
        
        crownValue.convertRotationalDelta(rotationalDelta)
        
        if crownValue.isReachValueToShowResult() {
            gachaImage.setImageNamed("red")
            pushController(withName: "ResultView", context: nil)
        } else {
            crownValue.changeValueCalculate()
            setHandleAnimations(crownValue.getCountRotationValue(), crownValue.getOldValue())
        }
        
    }
    
    func setHandleAnimations(_ rotationValue: Double, _ beforeRotationValue: Double) {
        handleImage.setImageNamed("handleImage\(Int(rotationValue))")
        print("handleImage\(Int(rotationValue))")
    }
    
}

