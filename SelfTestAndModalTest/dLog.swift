//
//  dLog.swift
//  PearTest
//
//  Created by jay on 2020/02/04.
//  Copyright © 2020 jay. All rights reserved.
//

import Foundation

func currentTime() -> String {
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let seconds = calendar.component(.second, from: date)
    let nanosecond = calendar.component(.nanosecond, from: date)
    return "\(hour):\(minutes):\(seconds).\(nanosecond)"
}

func print(_ item: @autoclosure () -> Any, separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.print(item(), separator: separator, terminator: terminator)
    #endif
}

func debugPrint(_ item: @autoclosure () -> Any, separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.debugPrint(item(), separator: separator, terminator: terminator)
    #endif
}

func dLog(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line ) {
    print("--------------------\n\(function) \(file):\(line)")
    print(currentTime())
    items.forEach { print($0) }
    print("--------------------")
}

func ddLog(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line ) {
    print("--------------------\n\(function) \(file):\(line)")
    print(currentTime())
    items.forEach { debugPrint($0) }
    print("--------------------")
}
