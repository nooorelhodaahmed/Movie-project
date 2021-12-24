//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by norelhoda on 16.12.2021.
//

import UIKit
import Firebase
class MovieDetailViewController: UIViewController {

    //MARK:- Proporties
    var id : String?
    var backButton = UIButton()
    var data : [MovieDetail] = []
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var plot: UITextView!
   
    @IBOutlet weak var IMB: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print(id)
        Analytics.logEvent("MovieDetails", parameters: nil)
        Services().getmovieDetails(Parmters: id!) { success in
            print(success)
            self.year.text = success.imdbRating
            self.language.text = success.language
            self.country.text = success.country
            self.plot.text = success.plot
            self.id = success.imdbID
            self.name?.text = success.title
            self.movieImage?.downloaded(from: success.poster!)
            self.configureUI()
        }
    }
    
    //MARK:- Helper function
    
    func configureUI(){
        let backButton2: UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
            self.navigationItem.leftBarButtonItem = backButton2
        
        backButton.setImage(UIImage(named:"back" ), for: .normal)
        self.view.addSubview(backButton)
        backButton.anchor(top:self.view.topAnchor,left:self.view.leftAnchor,paddingTop: 40,paddingLeft: 10,width: 17, height: 17)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        movieImage.contentMode = .scaleAspectFit
        name.textAlignment = .center
        name.textColor = UIColor.black
        name.font = UIFont.boldSystemFont(ofSize: 20)
        IMB.layer.cornerRadius = 5
        IMB.layer.masksToBounds = true
        
        countryLabel.layer.cornerRadius = 5
        countryLabel.layer.masksToBounds = true
        
        languageLabel.layer.cornerRadius = 5
        languageLabel.layer.masksToBounds = true
        
        plotLabel.layer.cornerRadius = 5
        plotLabel.layer.masksToBounds = true
    }
    
    @objc func backAction(){
        self.dismiss(animated: true, completion: nil)
    }
}
