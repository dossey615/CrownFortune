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
    var timer:Timer = Timer()
    
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
    /// - parameter WKCrown: Digital Crownを変更したかの真理値
    /// - parameter rotationalDelta: Digital Crownを前回の変更からいくつまわしたかの判定
    /// - Returns: なし
    func crownDidRotate(_ WKCrown: WKCrownSequencer?, rotationalDelta: Double){
        
        crownValue.convertRotationalDelta(rotationalDelta)
        
        if crownValue.isReachValueToShowResult() && isFirst{
            self.isFirst = false
            WKInterfaceDevice.current().play(.success)
            let gachaName = gacha.randomChoiseCase()
            gachaImage.setImageNamed(gachaName)
            self.crownSequencer.resignFocus() //フォーカスを終了し、値の取得を終了する
            timer = Timer.scheduledTimer(
                timeInterval: 2,
                target: self,
                selector:  #selector(InterfaceController.showInterface),
                userInfo: nil,
                repeats: false
            )
        } else {
            crownValue.changeValueCalculate()
            let byCount = crownValue.getCountRotationValue()
            autoreleasepool {
                gachaImageSet.setBackgroundImageNamed(gacha.gachaAnimation(byCount))
            }
            setHandleAnimations(byCount, nil)
        }
        
    }
    
    @objc func showInterface(){
        presentController(withName: "ResultView", context: nil)
    }
    
    /// UIimageの画像を差し替え、アニメーションを再現するメソッド
    /// - parameter rotationValue: 今回どれだけcrownを回したか
    /// - parameter beforeRotationValue: 前回どれほど回したかのcrownの値(nil許容)
    func setHandleAnimations(_ rotationValue: Double, _ beforeRotationValue: Double?) {
        autoreleasepool {
            handleImage.setImageNamed("handleImage\(Int(rotationValue))")
        }
    }
    
}

