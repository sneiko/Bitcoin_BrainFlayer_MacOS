//
//  MainNSWindow.swift
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/10/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

import Cocoa

class MainNSWindow: NSWindow {

    @IBOutlet weak var logTxt: NSTextField!
    @IBOutlet weak var prufLogTxt: NSTextField!
    @IBOutlet weak var startButton: NSButton!
    
    @IBOutlet weak var dictinaryButton: NSButton!
    @IBOutlet weak var passHashFilenameTxt: NSTextField!
    @IBOutlet weak var prufFilenameTxt: NSTextField!
    
    @IBOutlet weak var threadsNumberLabel: NSTextField!
    
    @IBOutlet weak var inDictinaryLbl: NSTextField!
    @IBOutlet weak var emptyLbl: NSTextField!
    @IBOutlet weak var txsLbl: NSTextField!
    @IBOutlet weak var withBtcLbl: NSTextField!
    @IBOutlet weak var sumCashLbl: NSTextField!
    
    @IBOutlet weak var loadingIndicator: NSLevelIndicator!
    
    @IBAction func threadsStepperAction(_ sender: Any) {
    }
    
    @IBAction func openDictinary(_ sender: Any) {
        
    }
    
    @IBAction func startAction(_ sender: Any) {
       
    }
}
