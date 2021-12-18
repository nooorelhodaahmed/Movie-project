//
//  ViewController.swift
//  Movie
//
//  Created by norelhoda on 15.12.2021.
//

import UIKit

class SplashScreen: UIViewController {

    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func pressButton(_ sender: Any) {
        
        if !connectedToNetwork(){
            let alert = UIAlertController(title: "warning", message: "Please check your internet connection", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

           self.present(alert, animated: true, completion: nil)
        }
        else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let secondViewController = storyboard.instantiateViewController(withIdentifier: "MainTableViewController") as! MainTableViewController
                secondViewController.modalPresentationStyle = .fullScreen
                self.present(secondViewController, animated: true, completion: nil)
            }
           
        }
    }
    
}

