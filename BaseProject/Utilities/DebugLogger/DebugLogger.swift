//
//  DebugLogger.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation

//MARK: - Debug Flag
#warning("Turning debugMode `false` will disable logging throughout the app.")
fileprivate let debugMode : Bool = true
fileprivate var haveInformedDevAboutDebugMode: Bool = false

//MARK: - Log type
enum LogType : String {
    case error = "[ERROR]"
    case info = "[INFO]"
    case debug = "[DEBUG]"
    case warning = "[WARNING]"
    case success = "[SUCCESS]"
    case networkResponse = "[NETWORK RESPONSE]"
    case selfNotAvailable = "[ERROR - Self not Available]"
    case optionalUnwrapFail = "[OPTIONAL UNWRAP FAILURE]"
}

//MARK: - logger
func debugLog(logType: LogType = .info, anyObject: Any? = nil, text: String = "", fileName: String = #file, function: String = #function, line: Int = #line) {
    if debugMode {
        if let anyObject = anyObject {
            print("\(logType.rawValue) [\((fileName as NSString).lastPathComponent), in \(function) at line: \(line), at \(timeForDebugLog())] : \(text)")
            print(anyObject)
        } else {
            if (logType == .selfNotAvailable || logType == .optionalUnwrapFail) {
                print("\(logType.rawValue) [\((fileName as NSString).lastPathComponent), in \(function) at line: \(line), at \(timeForDebugLog())] : Falling through")
            } else {
                print("\(logType.rawValue) [\((fileName as NSString).lastPathComponent), in \(function) at line: \(line), at \(timeForDebugLog())] : \(text)")
            }
        }
    } else {
        if haveInformedDevAboutDebugMode == false {
            print("[WARNING] Debug Mode Disabled [WARNING]")
            haveInformedDevAboutDebugMode = true
        }
    }
    
    func timeForDebugLog() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
        
        return dateFormatter.string(from: Date())
    }
}
