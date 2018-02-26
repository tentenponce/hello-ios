//
//  RatingControl.swift
//  hello-ios
//
//  Created by TenTen on 2/26/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons(color: UIColor.red)
        setupButtons(color: UIColor.blue)
        setupButtons(color: UIColor.green)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons(color: UIColor.red)
        setupButtons(color: UIColor.blue)
        setupButtons(color: UIColor.green)
    }
    
    private func setupButtons(color: UIColor) {
        let button = UIButton()
        button.backgroundColor = color
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        addArrangedSubview(button)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
