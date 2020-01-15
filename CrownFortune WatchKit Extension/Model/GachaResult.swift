//
//  GachaResult.swift
//  CrownFortune WatchKit Extension
//
//  Created by 土居将史 on 2019/12/14.
//  Copyright © 2019 土居将史. All rights reserved.
//

import Foundation

class GachaResult {

    fileprivate var resultList:Array<String> //ガチャの結果一覧
    
    init(){
        resultList = ["大吉", "中吉", "吉", "末吉", "凶", "大凶"]
    }
    
    func changeProbability(_ parsent: Int, value : String) {
        deleteResult(value)
    }
    
    func deleteResult(_ value: String) {
        
    }
    
    func lotteryResult() -> String {
        let result = resultList.randomElement()
        return result!
    }
    
}
