//
//  Services.swift
//  Porland - Takimini Olustur
//
//  Created by Caner Onat on 10.01.2021.
//

import Alamofire
import AlamofireMapper
import ProgressHUD
import UIKit


class Services {
    
    
    //MARK:- Authentication
    
    
    public func getAllMovie(successCompletion: @escaping ((_ json : MoviesModel) -> Void)){
       
        let headers = ["Accept":"application/json"]
        ProgressHUD.show()
        Alamofire.request("https://www.omdbapi.com/?s=all&apikey=5b622e9b&page=all" , method: .get, encoding: JSONEncoding.default, headers: headers).responseObject { (response : DataResponse<MoviesModel>) in
            
                switch response.result {
                case .success( _):
                    let json = response.data
                        let decoder = JSONDecoder()
                       
                        do {
                           
                            let usersList: MoviesModel = try decoder.decode(MoviesModel.self, from: json!)
                            print(usersList)
                          
                            successCompletion(usersList)
                            ProgressHUD.dismiss()
                            break
                         }
                             catch {
                                ProgressHUD.dismiss()
                                break
                           
                        }
                case .failure(let error):
                    print(error.localizedDescription)
                    ProgressHUD.dismiss()
                    break
                }
           }
    }
    
    
    public func getmovieDetails(Parmters :String,successCompletion: @escaping ((_ json : MovieDetail) -> Void)){
       
        let headers = ["Accept":"application/json"]
       
        Alamofire.request("https://www.omdbapi.com/?i=\(Parmters)&apikey=5b622e9b",method: .post, parameters: ["ID":Parmters],encoding: JSONEncoding.default, headers: headers).responseObject { (response : DataResponse<MovieDetail>) in
            
                switch response.result {
                case .success( _):
                    let json = response.data
                        let decoder = JSONDecoder()
                       
                        do {
                           
                            let usersList: MovieDetail = try decoder.decode(MovieDetail.self, from: json!)
                            print(usersList)
                          
                            successCompletion(usersList)
                            ProgressHUD.dismiss()
                            break
                           
                        }
                             catch {
                                ProgressHUD.dismiss()
                                break
                           
                        }
                case .failure(let error):
                  
                    print(error.localizedDescription)
                    ProgressHUD.dismiss()
                    break
                }
           }
    }
}


