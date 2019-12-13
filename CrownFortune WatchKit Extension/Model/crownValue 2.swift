//
//  crownValue.swift
//  CrownFortune WatchKit Extension
//
//  Created by 土居将史 on 2019/12/13.
//  Copyright © 2019 土居将史. All rights reserved.
//

import Foundation

class CrownValue {

    final let NEED_VALUE_TO_RESULT: Double = 4000.0 //結果画面を出すのに必要なクラウンの変化量
    final let MAX_ROTATION_VALUE = 72.0 //変化量の最大値
    final let MIN_ROTATION_VALUE = 0.0 //変化量の最低値
    
    var countRotationValue: Double //今回のクラウン回転量に基づく現在の回転角の値
    var changeValue: Double //クラウンの回転量の総合変化量
    var oldValue: Double //クラウンの回転量が変化する前の回転量
    var isShowResult: Bool //クラウンの回転量が結果を表示する量に達したかのフラグ
    
    init () {
        countRotationValue = 1.0
        changeValue = 0.0
        oldValue = 0.0
        isShowResult = false
    }

    func changeValueCalculate(){
        self.changeValue += (MAX_ROTATION_VALUE - countRotationValue)
    }

    func isReachValueToShowResult() -> Bool {
        isShowResult = changeValue >= NEED_VALUE_TO_RESULT
        return isShowResult
    }

    func checkValueForOverLimit() {
        if countRotationValue >= MAX_ROTATION_VALUE {
            self.setCountRotationValue(1.0)
        } else if countRotationValue <= MIN_ROTATION_VALUE {
            self.setCountRotationValue(71.0)
        }
    }

    func convertRotationalDelta(_ rotationalDelta: Double) {
        self.countRotationValue += floor(rotationalDelta*100)
        self.checkValueForOverLimit()
    }

    func setCountRotationValue(_ countRotationValue: Double) {
        self.countRotationValue = countRotationValue
    }

    func setChangeValue(_ oldValue: Double) {
        self.oldValue = oldValue
    }

    func setOldValue(_ oldValue: Double) {
        self.oldValue = oldValue
    }

    func getCountRotationValue() -> Double {
        return countRotationValue
    }

    func getChangeValue() -> Double {
        return changeValue
    }

    func getOldValue() -> Double {
        return oldValue
    }

}
