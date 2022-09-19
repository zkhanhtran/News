//
//  Date+Extension.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation

extension Date {
    func stringDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
