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
    var movieImage = UIImageView()
    var backButton = UIButton()
    var name = UILabel()
   
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var plot: UILabel!
    // @IBOutlet weak var description: UITextView!
    var data : [MovieDetail] = []
    
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
            self.configureUI()
        }
    }
    
    //MARK:- Helper function
    
    func configureUI(){
        let backButton2: UIBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backAction))
            self.navigationItem.leftBarButtonItem = backButton2
        
        backButton.setImage(UIImage(named:"back" ), for: .normal)
        self.view.addSubview(backButton)
        backButton.anchor(top:self.view.topAnchor,left:self.view.leftAnchor,paddingTop: 40,paddingLeft: 10,width: 25, height: 25)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        movieImage.contentMode = .scaleAspectFit
        view.addSubview(movieImage)
        movieImage.anchor(top: self.backButton.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 20, paddingLeft: 16,  paddingRight: 16, width: 500, height: 200)
        view.addSubview(name)
        name.anchor(top:movieImage.bottomAnchor,left: self.view.leftAnchor,right: self.view.rightAnchor,paddingTop: 30,paddingLeft: 50,paddingRight: 50)
        name.textAlignment = .center
        name.textColor = UIColor.black
        name.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    @objc func backAction(){
        self.dismiss(animated: true, completion: nil)
    }
}
