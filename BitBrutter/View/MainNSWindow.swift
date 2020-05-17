//
//  MainNSWindow.swift
//  BitBrutter
//
//  Created by Sergey Neikovich on 5/10/20.
//  Copyright © 2020 F Developers. All rights reserved.
//

import Cocoa

class MainNSWindow: NSWindow {

    @IBOutlet weak var logTxt: NSTextView!
    @IBOutlet weak var prufLogTxt: NSTextView!
    @IBOutlet weak var startButton: NSButton!

    @IBOutlet weak var dictinaryButton: NSButton!
    @IBOutlet weak var dictinaryTxt: NSTextField!

    @IBOutlet weak var threadsNumberLabel: NSTextField!

    @IBOutlet weak var inDictinaryLbl: NSTextField!
    @IBOutlet weak var emptyLbl: NSTextField!
    @IBOutlet weak var txsLbl: NSTextField!
    @IBOutlet weak var withBtcLbl: NSTextField!
    @IBOutlet weak var sumCashLbl: NSTextField!
    @IBOutlet weak var activeThreadsLbl: NSTextField!

    // MARK: Private vars
    private var startBrutState = false
    private var dictinaryFilePath = ""
    private var threadsCount = 5 {
        didSet {
            threadsNumberLabel.stringValue = "Threads: \(threadsCount)"
        }
    }

    @IBAction func threadsStepperAction(_ sender: NSStepper) {
        threadsCount = sender.integerValue
    }

    @IBAction func openDictinary(_ sender: NSButton) {

        changeUiState(isEnable: false)

        let dialog = NSOpenPanel();
        dialog.title                   = "Choose a .txt file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["txt"];

        guard dialog.runModal() == .OK else {
            changeUiState(isEnable: true)
            return
        }

        if let result = dialog.url {
            dictinaryFilePath = result.path
            dictinaryTxt.stringValue = result.path

            changeUiState(isEnable: true)

            log(type: .success, row: "Open dictinary: \(result.path)")
        }
    }

    @IBAction func startAction(_ sender: NSButton) {

        guard checkImportantVars() else {
            return
        }

        log(type: .success, row: "Start ...")

        changeUiState(isEnable: false)
        var wordCount: Int = 8
        let mnemonicGenerator = MnemonicGenerator.init(dictinaryPath: dictinaryFilePath,
                wordsCount: &wordCount,
                logDelegate: self,
                delegate: self)

        guard let mnemonic = mnemonicGenerator else {
            print(toLog: .error, message: "Error with mnemonic class!")
            return
        }

        while (startBrutState) {
            brutCheck(mnemonic: mnemonic)
        }

        changeUiState(isEnable: true)
    }

    private func checkImportantVars() -> Bool {
        guard dictinaryFilePath != "" else {
            log(type: .error, row: "Choose dictinary file for continue!")
            return false
        }

        guard threadsCount != 0 else {
            log(type: .error, row: "Threads need be one or more!")
            return false
        }
        return true
    }

    private func changeUiState(isEnable: Bool) {
        startBrutState = !isEnable
        startButton.stringValue = isEnable ? "Start" : "Stop"
        dictinaryButton.isEnabled = isEnable
    }
}

//  MARK: Checking func's
extension MainNSWindow {
    func brutCheck(mnemonic: MnemonicGenerator) {
        let privateKeys = mnemonic.generate()
         
        // TODO: Implement making public keys and addresses 
        
        let checker = WalletChecker(delegate: self)
        checker?.massCheck([])
        
        startBrutState = false
    }
}

//    MARK: Work with log
extension MainNSWindow: LogDelegate {

    func print(toLog type: LogMessageType, message: String!) {
        log(type: type, row: message)
    }

    private func log(type: LogMessageType, row: String) {
        var color = NSColor.red
        switch type {
        case .error:
            color = NSColor.red
        case .success:
            color = NSColor.green
        case .warning:
            color = NSColor.blue
        @unknown default:
            color = NSColor.systemPink
        }

        NSLog("[LOG]: \(row)")

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

        NSLog("[LOG]: \(row)")

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

extension MainNSWindow: MnemonicDelegate {
    func words(inDictionary count: UInt) {
        inDictinaryLbl.stringValue = "In dictionary: \(count)"
    }
}

extension MainNSWindow: WalletCheckerDelegate {
    func massCheckCallback(_ wallets: NSMutableArray!) {
        print(toLog: .error, message: "error")
    }
}
