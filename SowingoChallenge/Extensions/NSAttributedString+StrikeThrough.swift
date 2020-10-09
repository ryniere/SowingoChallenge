//
//  NSAttributedString+StrikeThrough.swift
//  SowingoChallenge
//
//  Created by Ryniere dos Santos Silva on 2020-10-08.
//

import Foundation

extension NSAttributedString {

    /// Returns a new instance of NSAttributedString with same contents and attributes with strike through added.
     /// - Parameter style: value for style you wish to assign to the text.
     /// - Returns: a new instance of NSAttributedString with given strike through.
     func withStrikeThrough(_ style: Int = 1) -> NSAttributedString {
         let attributedString = NSMutableAttributedString(attributedString: self)
         attributedString.addAttribute(.strikethroughStyle,
                                       value: style,
                                       range: NSRange(location: 0, length: string.count))
         return NSAttributedString(attributedString: attributedString)
     }
}
