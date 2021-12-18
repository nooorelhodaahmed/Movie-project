//
//  CardView.swift
//  Movie
//
//  Created by norelhoda on 16.12.2021.
//

import UIKit
class CardView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
        
    }
    
    func initializeView() {
        
        self.backgroundColor = .white
        let shadowPath = UIBezierPath(rect: CGRect(x: 2,y: 2,width: self.frame.width + 2,height: self.frame.height + 2))
                   self.layer.shadowPath = shadowPath.cgPath
                   self.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
                   self.layer.shadowOpacity = 0.16
                   self.layer.shadowRadius =  6
                   self.layer.shadowPath = shadowPath.cgPath
                   self.layer.cornerRadius = 6
                   self.layer.masksToBounds = false
        
    }
}
