//
//  ViewController.swift
//  SearchBar
//
//  Created by Arti on 19/12/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UISearchBarDelegate{
    
    var array:[String] = ["Tushar","Suraj","Madhav","Sumit"]
    var filters:[String]!
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        filters = array
        searchTableView.dataSource = self
        searchbar.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = filters[indexPath.row]
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchbar.searchTextField.text)
        filters = []
        if searchText == ""  {
            filters == array
        }
        for work in array {
            if work.uppercased().contains(searchText.uppercased()) {
                filters.append(work)
            }
        }
        self.searchTableView.reloadData()
    }
    
    
}

