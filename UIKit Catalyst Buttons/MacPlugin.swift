//
//  MacPlugin.swift
//  MacPlugin
//
//  Created by Dylan McDonald on 2/6/22.
//  Copyright © 2022 Dylan McDonald. All rights reserved.
//

import Foundation
import AppKit

class MacPlugin: NSObject, Plugin {
    required override init() {
    }
    
    func createColorObject(from cgColor: CGColor) -> NSObject {
        return NSColor(cgColor: cgColor) ?? NSColor.systemBlue
    }
    
    func makeWindowsTranslucent() {
        let button = NSButton()
//        button.controlSize = .large
        button.bezelStyle = .push
        
        for window in NSApplication.shared.windows {
            guard let contentView = window.contentView else { continue }
            
            if !contentView.subviews.contains(where: { $0 is NSVisualEffectView }) {
                let visualEffectView = NSVisualEffectView()
                visualEffectView.material = .underWindowBackground
                visualEffectView.blendingMode = .behindWindow
                visualEffectView.autoresizingMask = [.width, .height]
                visualEffectView.frame = contentView.bounds
                
                contentView.subviews.insert(visualEffectView, at: 0)
            }
            
            window.isOpaque = false
        }
    }
    
    
}
