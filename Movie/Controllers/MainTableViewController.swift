//
//  MainTableViewController.swift
//  Movie
//
//  Created by norelhoda on 16.12.2021.
//

import UIKit

class MainTableViewController: UITableViewController,UISearchBarDelegate, UISearchResultsUpdating {
    
//MARK:-Proporties

    var data :[Search] = []
    var filteredData :[Search] = []
  
    var resultSearchController = UISearchController()
    
    //MARK:- LifeCycel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultSearchController = ({
                let controller = UISearchController(searchResultsController: nil)
                controller.searchResultsUpdater = self
                controller.dimsBackgroundDuringPresentation = false
                controller.searchBar.sizeToFit()
                tableView.tableHeaderView = controller.searchBar
                return controller
            })()

            // Reload the table
            tableView.reloadData()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        fetchData()
    }

    // MARK: - Table view data source

    func fetchData(){
        Services().getAllMovie { [self] success in
            if success.response == "false" {
                let alert = UIAlertController(title: "warning", message: "something went wrong please try again later", preferredStyle: .alert)

                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                        // show the alert
               self.present(alert, animated: true, completion: nil)
            }
            else {
                self.data = success.search!
                
                self.tableView.reloadData()
                print(success)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
              return filteredData.count
          } else {
              return data.count
        
          }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell"))! as! MyCardCell
     
        if (resultSearchController.isActive) {
            cell.backgroundColor = UIColor.white
            cell.bannerImage.downloaded(from: filteredData[indexPath.row].poster ?? "")
            cell.year.text = filteredData[indexPath.row].year
            cell.name.text = filteredData[indexPath.row].title
            cell.selectionStyle = .none
            return cell
             
          }
          else {
            cell.backgroundColor = UIColor.white
            cell.bannerImage.downloaded(from: data[indexPath.row].poster ?? "")
            cell.year.text = data[indexPath.row].year
            cell.name.text = data[indexPath.row].title
            cell.selectionStyle = .none
            return cell
          }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        secondViewController.id = data[indexPath.row].imdbID
        secondViewController.name.text = data[indexPath.row].title
        secondViewController.movieImage.downloaded(from: data[indexPath.row].poster!)
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true, completion: nil)
    }

    
    func updateSearchResults(for searchController: UISearchController) {
        filteredData.removeAll(keepingCapacity: false)

        let searchTerm = searchController.searchBar.text!

        let array = data.filter { result in
            return (result.title?.contains(searchTerm))!
                  
        }
        filteredData = array

            self.tableView.reloadData()
    }
}
