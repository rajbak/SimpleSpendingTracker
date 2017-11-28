//
//  StringHelper.swift
//  SimpleSpendingTracker
//
//  Created by rajbak on 25/11/2017.
//  Copyright © 2017 rajbak. All rights reserved.
//

import Foundation

struct StringHelper {
    
    private init() {
    }
    
    static func isNumeric(_ string: String) -> Bool {
        var result = true
        
        if string.count > 0 {
            let disallowedCharacterSet = NSCharacterSet(charactersIn: "0123456789.,").inverted
            let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil;
            
            let scanner = Scanner.localizedScanner(with: string) as! Scanner
            let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.isAtEnd
            
            result = replacementStringIsLegal && resultingTextIsNumeric
        }
        
        return result
    }
}
