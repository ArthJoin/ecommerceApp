//
//  InstantPanGestureRecognizer.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 10.11.2023.
//

import UIKit

class InstantPanGestureRecognizer: UIPanGestureRecognizer {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if (self.state == .began) { return }
        super.touchesBegan(touches, with: event)
        self.state = .began
    }
}
