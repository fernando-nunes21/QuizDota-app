//
//  BorderButton.swift
//  quizDota-app
//
//  Created by Fernando on 08/02/22.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 4.0
        layer.borderColor = UIColor.red.cgColor
    }

}
