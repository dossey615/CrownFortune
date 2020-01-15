//
//  GachaImages.swift
//  CrownFortune WatchKit Extension
//
//  Created by 土居将史 on 2019/12/13.
//  Copyright © 2019 土居将史. All rights reserved.
//

import Foundation

class GachaImages {
    
    fileprivate let caseList:Array<String> //ガチャガチャのケースリスト
    fileprivate let animationCase:Array<String>//ガチャガチャのアニメーション
    
    fileprivate var recentAnimation:String //
    
    init(){
        caseList = ["red", "yellow", "blue"]
        animationCase = ["box-1", "box-2", "box-3", "box-4"]
        recentAnimation = "box-1"
    }
    
    ///
    func randomChoiseCase() -> String{
        let result = caseList.randomElement()!
        return result
    }
    
    ///ガチャガチャの中のカプセルが動き回るアニメーションを処理するメソッド
    /// - parameter rotate: crownを回した値
    /// - returns: セットするイメージファイルの名称
    func gachaAnimation(_ rotate: Double) -> String {
        var result: String
        if Int(rotate) % 2 == 0 {
            result = animationCase.randomElement()!
            self.recentAnimation = result
            return result
        } else {
            result = self.recentAnimation
            return result
        }
    }
    
}
