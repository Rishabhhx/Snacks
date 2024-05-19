//
//  RoundBoardedRedTextField.swift
//  Snacks
//
//  Created by Rishabh Sharma on 27/03/24.
//

import Foundation
import UIKit

class RoundBoardedRedTextField: UITextField {
        
    func setup() {
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}
