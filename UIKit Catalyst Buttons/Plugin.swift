//
//  Plugin.swift
//  School Assistant
//
//  Created by Dylan McDonald on 2/6/22.
//  Copyright © 2022 Dylan McDonald. All rights reserved.
//

import Foundation
import AppKit

@objc(Plugin)
protocol Plugin: NSObjectProtocol {
    init()

    func makeWindowsTranslucent()
    func createColorObject(from cgColor: CGColor) -> NSObject
}


func makeWindowsTranslucentMacPlugin() {
    let bundleFileName = "MacPlugin.bundle"
    guard let bundleURL = Bundle.main.builtInPlugInsURL?
        .appendingPathComponent(bundleFileName) else { return }
    guard let bundle = Bundle(url: bundleURL) else { return }
    let className = "MacPlugin.MacPlugin"
    guard let pluginClass = bundle.classNamed(className) as? Plugin.Type else { return }
    let plugin = pluginClass.init()
    plugin.makeWindowsTranslucent()
}

func createColorObjectMacPlugin(cgColor: CGColor) -> NSObject? {
    let bundleFileName = "MacPlugin.bundle"
    guard let bundleURL = Bundle.main.builtInPlugInsURL?
        .appendingPathComponent(bundleFileName) else { return nil }
    guard let bundle = Bundle(url: bundleURL) else { return nil }
    let className = "MacPlugin.MacPlugin"
    guard let pluginClass = bundle.classNamed(className) as? Plugin.Type else { return nil }
    let plugin = pluginClass.init()
    return plugin.createColorObject(from: cgColor)
}
