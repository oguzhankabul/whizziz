//
//  UIView+Extensions.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import UIKit

public  extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
    
    var viewWidth: CGFloat {
        return self.frame.size.width
    }
    
    var viewHeight: CGFloat {
        return self.frame.size.height
    }
}
