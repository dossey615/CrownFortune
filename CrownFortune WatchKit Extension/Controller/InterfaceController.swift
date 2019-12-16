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

    
    @IBOutlet weak var gachaImageSet: WKInterfaceGroup!
    @IBOutlet weak var handleImage: WKInterfaceImage!
    @IBOutlet weak var gachaImage: WKInterfaceImage!
   
        
    var crownValue = CrownValue()
    var gacha = GachaImages()
    var isFirst = true
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        super.willActivate()
        let monitoringCrown = self.crownSequencer //crown関連のイベントを監視するインスタンスの取得
        monitoringCrown.delegate = self
        monitoringCrown.focus() //crownインターフェースにフォーカスし、値の取得を開始する.
        
        //初期設定にする
        crownValue = CrownValue()
        gacha = GachaImages()
        isFirst = true
        gachaImage.setImage(nil)
        handleImage.setImageNamed("handleImage1")
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    
    ///
    /// クラウンを操作した際に動くメソッド
    /// - Parameters:
    ///     - _: Digital Crownを変更したかの真理値
    ///     - rotationalDelta: Digital Crownを前回の変更からいくつまわしたかの判定
    /// - Returns: nothing
    func crownDidRotate(_ WKCrown: WKCrownSequencer?, rotationalDelta: Double){
        
        
        crownValue.convertRotationalDelta(rotationalDelta)
        
        if crownValue.isReachValueToShowResult() && isFirst{
            self.isFirst = false
            let gachaName = gacha.randomChoiseCase()
            gachaImage.setImageNamed(gachaName)
            presentController(withName: "ResultView", context: gachaName)
            
        } else {
            crownValue.changeValueCalculate()
            let byCount = crownValue.getCountRotationValue()
            gachaImageSet.setBackgroundImageNamed(gacha.gachaAnimation(byCount))
            setHandleAnimations(byCount, nil)
        }
        
    }
    
    func setHandleAnimations(_ rotationValue: Double, _ beforeRotationValue: Double?) {
        handleImage.setImageNamed("handleImage\(Int(rotationValue))")
    }
    
}

