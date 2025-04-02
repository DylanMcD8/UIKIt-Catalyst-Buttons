//
//  UIButton Extensions.swift
//  UIKit Catalyst Buttons
//
//  Created by Dylan McDonald on 4/1/25.
//

import UIKit

extension UIButton {
#if targetEnvironment(macCatalyst)
    private func decode(_ base64: String) -> String {
        guard let data = Data(base64Encoded: base64),
              let decodedString = String(data: data, encoding: .utf8) else {
            return ""
        }
        return decodedString
    }

    var nsButton: NSObject? {
        let buttonMacVisualElement = subviews.first { view in
            return String(describing: type(of: view)) == decode("VUlCdXR0b25NYWNWaXN1YWxFbGVtZW50")
        }
        
        let uiNSView = buttonMacVisualElement?.subviews.first { view in
            return String(describing: type(of: view)) == decode("X1VJTlNWaWV3")
        }
        
        return uiNSView?.value(forKey: decode("Y29udGVudE5TVmlldw==")) as? NSObject
    }
#endif
    
#if targetEnvironment(macCatalyst)
    var bezelColor: NSObject? {
        get {
            return nsButton?.value(forKey: decode("YmV6ZWxDb2xvcg==")) as? NSObject
        }
        set {
            if let nsButton = nsButton {
                nsButton.setValue(newValue, forKey: decode("YmV6ZWxDb2xvcg=="))
                print("SET BEZEL COLOR")
            } else {
                print("FAILED TO GET NSBUTTON")
            }
        }
    }
#else
    var bezelColor: NSObject? {
        get { return nil }
        set { }
    }
#endif
    
    func setBezelColor(_ color: UIColor) {
        let cgColor = color.cgColor
        if let colorObject = createColorObjectMacPlugin(cgColor: cgColor) {
            print("Color object created")
            print(colorObject)
            bezelColor = colorObject
        } else {
            print("Error creating color object")
        }
    }
    

#if targetEnvironment(macCatalyst)
    var controlSize: ControlSize {
        get {
            let rawValue = nsButton?.value(forKey: decode("Y29udHJvbFNpemU=")) as? Int
            return ControlSize(rawValue: rawValue ?? 0) ?? .regular
        }
        set {
            nsButton?.setValue(newValue.rawValue, forKey: decode("Y29udHJvbFNpemU="))
        }
    }
#else
    var controlSize: ControlSize {
        get { return .regular }
        set { }
    }
#endif
}


enum ControlSize: Int {
    case regular = 0
    case small = 1
    case mini = 2
    case large = 3
}
