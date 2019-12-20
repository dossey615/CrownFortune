//
//  ResultInterfaceController.swift
//  CrownFortune WatchKit Extension
//
//  Created by 土居将史 on 2019/12/14.
//  Copyright © 2019 土居将史. All rights reserved.
//

import WatchKit
import Foundation


class ResultInterfaceController: WKInterfaceController {
    
    @IBAction func retryButton() {
        self.dismiss()
    }
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    
    var gachaResult = GachaResult()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        resultLabel.setText(gachaResult.lotteryResult())

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        print("動かない")
    }

}
