//
//  Logger+Pimco.swift
//  JustLog
//
//  Created by Aziz Uysal on 6/6/17.
//
//

import Foundation
import SwiftyBeaver

extension Logger {
  public func trace(_ level: SwiftyBeaver.Level = .verbose, error: NSError? = nil, userInfo: [String : Any]? = nil, _ file: String = #file, _ function: String = #function, _ line: UInt = #line) {
    let filename = ((file as NSString).lastPathComponent as NSString).deletingPathExtension
    let updatedUserInfo = [logTypeKey: stringForLevel(level)].merged(with: userInfo ?? [String : Any]())
    let logMessage = self.logMessage("\(filename) - \(function)", error: error, userInfo: updatedUserInfo, file, function, line)
    internalLogger.custom(level: level, message: logMessage, file: file, function: function, line: Int(line))
  }
  
  private func stringForLevel(_ level: SwiftyBeaver.Level) -> String {
    switch level {
    case .verbose:
      return "verbose"
    case .debug:
      return "debug"
    case .info:
      return "info"
    case .warning:
      return "warning"
    case .error:
      return "error"
    }
  }
}
