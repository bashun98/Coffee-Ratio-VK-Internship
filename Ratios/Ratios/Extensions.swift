//
//  Extensions.swift
//  Ratios
//
//  Created by Евгений Башун on 24.04.2022.
//  Copyright © 2022 John Peden. All rights reserved.
//

import UIKit

extension UITextField {
    @objc
    func doneButtonTapped(button: UIBarButtonItem) -> Void {
        self.resignFirstResponder()
    }
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
