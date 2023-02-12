//
//  L10n.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import Foundation

private final class BundleToken {
    static let bundle: Bundle = {
        Bundle(for: BundleToken.self)
    }()
}

public class L10n {
    public static func get(_ key: String, parameter: [CVarArg] = []) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: "Localizable")
        return String(format: format, locale: Locale.current, arguments: parameter)
    }
    
    static var language: String {
        return "en"
    }
}

public extension L10n {
    static let welcomeWhizzizTitle = get("welcomeWhizzizTitle")
    static let tryWhizzizButtonTitle = get("tryWhizzizButtonTitle")
    static let loginButtonTitle = get("loginButtonTitle")
    static let loginWithGoogleButtonTitle = get("loginWithGoogleButtonTitle")
}
