//
//  MainNSWindow.swift
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/10/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

import Cocoa

enum LogMessageType {
    case SUCCESS, WARNING, ERROR
}

class MainNSWindow: NSWindow {
    
    @IBOutlet weak var logTxt: NSTextView!
    @IBOutlet weak var prufLogTxt: NSTextView!
    @IBOutlet weak var startButton: NSButton!
    
    @IBOutlet weak var dictinaryButton: NSButton!
    @IBOutlet weak var dictinaryTxt: NSTextField!
    @IBOutlet weak var passHashFilenameTxt: NSTextField!
    @IBOutlet weak var prufFilenameTxt: NSTextField!
    
    @IBOutlet weak var threadsNumberLabel: NSTextField!
    
    @IBOutlet weak var inDictinaryLbl: NSTextField!
    @IBOutlet weak var emptyLbl: NSTextField!
    @IBOutlet weak var txsLbl: NSTextField!
    @IBOutlet weak var withBtcLbl: NSTextField!
    @IBOutlet weak var sumCashLbl: NSTextField!
    
    @IBOutlet weak var loadingIndicator: NSLevelIndicator!
    
    // MARK: Private vars
    var dictinaryFilePath = ""
    
    @IBAction func threadsStepperAction(_ sender: Any) {
    }
    
    @IBAction func openDictinary(_ sender: Any) {
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .txt file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["txt"];
        
        guard dialog.runModal() == .OK else {
            return
        }
        
        if let result = dialog.url {
            dictinaryFilePath = result.path
            dictinaryTxt.stringValue = result.path
            
            log(type: .SUCCESS, row: "Open dictinary: \(result.path)")
        }
    }
    
    @IBAction func startAction(_ sender: Any) {
        log(type: .SUCCESS, row: "Start ...")
    }
    
    private func log(type: LogMessageType, row: String) {
        var color = NSColor.red
        switch type {
        case .ERROR:
            color = NSColor.red
        case .SUCCESS:
            color = NSColor.green
        case .WARNING:
            color = NSColor.blue
        }
        
        let attributesText = NSAttributedString(string: "\(row)\n", attributes: [
            NSAttributedString.Key.foregroundColor : color
        ])
        
        guard let textStorage = logTxt.textStorage else {
            return
        }
        
        textStorage.insert(attributesText, at: textStorage.length)
        logTxt.scrollToEndOfDocument(nil)
    }
    
    private func logGoodBtc(row: String) {
        
        let attributesText = NSAttributedString(string: "\(row)\n", attributes: [
            NSAttributedString.Key.foregroundColor : NSColor.green
        ])
        
        guard let textStorage = prufLogTxt.textStorage else {
            return
        }
        
        textStorage.insert(attributesText, at: textStorage.length)
        prufLogTxt.scrollToEndOfDocument(nil)
    }
}
