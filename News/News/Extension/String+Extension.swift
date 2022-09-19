//
//  String+Extension.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import Foundation

extension String {
    func toDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = formatter.date(from: self)
        return date ?? Date()
    }
}

extension Optional where Wrapped: Collection {
    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}
