//
//  DateHelper.swift
//  SimpleSpendingTracker
//
//  Created by rajbak on 30/11/2017.
//  Copyright © 2017 rajbak. All rights reserved.
//

import Foundation

public extension Date {
    
    func toDateString(style: DateFormatter.Style = .long ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: self)
    }
}
