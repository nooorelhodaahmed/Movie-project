//
//  TableViewCell.swift
//  Movie
//
//  Created by norelhoda on 16.12.2021.
//

import UIKit

class MyCardCell: UITableViewCell {

    //MARK:- Proporties
    
    var bannerImage = UIImageView()
    var cardView = UIView()
    var name = UILabel()
    var year = UILabel()
   
    //MARK:- LifeCycle
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        configureUI()
    }
    
    //MARK:- Helper Function
    
    func  configureUI() {

        self.backgroundColor = .clear
        self.addSubview(cardView)
        
        cardView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor,paddingTop: 10,paddingLeft: 120,paddingRight: 16)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 25
        cardView.backgroundColor = UIColor("#1A2645")
        setShadow(button: cardView)
        cardView.addSubview(name)
        
        name.anchor(top: self.cardView.topAnchor, left: self.leftAnchor, paddingTop: 10, paddingLeft: 20)
        name.font = UIFont.boldSystemFont(ofSize: 18)
        name.textColor = UIColor.white
        name.textAlignment = .center
        name.backgroundColor = UIColor("#EC6244")
        name.layer.cornerRadius = 5
        name.layer.masksToBounds = true
        cardView.addSubview(bannerImage)
        
        bannerImage.anchor(top: self.name.bottomAnchor, left: self.cardView.leftAnchor, bottom: self.cardView.bottomAnchor, right: self.cardView.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 10 , paddingRight : 0)
        bannerImage.contentMode = .scaleAspectFill
        bannerImage.layer.cornerRadius = 125
        bannerImage.setDimensions(width: 250, height: 250)
        bannerImage.layer.cornerRadius = 150
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
       
        bannerImage.addSubview(year)
        year.anchor(top: self.name.bottomAnchor, left: self.leftAnchor, paddingTop: 20, paddingLeft: 40)
        year.font = UIFont.boldSystemFont(ofSize: 20)
        year.backgroundColor = UIColor("#EC6244")
        year.textColor = UIColor.white
        year.layer.cornerRadius = 2.5
        year.layer.masksToBounds = true
        
    }
    
    func setShadow(button: UIView) {
           
           let shadowPath = UIBezierPath(rect: CGRect(x: 2,y: 2,width: button.frame.width + 2,height: button.frame.height + 2))
           button.layer.shadowPath = shadowPath.cgPath
           button.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
           button.layer.shadowOpacity = 0.16
           button.layer.shadowRadius =  6
           button.layer.shadowPath = shadowPath.cgPath
       }
}
