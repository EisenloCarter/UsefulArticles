//
//  TableViewController.swift
//  te
//
//  Created by spidepa on 1/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let items = [
        "Jon Snow",
        "Bran",
        "Theon",
        "Tarly",
        "Tyrion",
        "Tywin",
        "Jaime",
        "Cersei",
        "Ned",
        "Robb",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchResultsController = storyboard?.instantiateViewController(withIdentifier: "searchResults")
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchBar.placeholder = "Searching name..."
        searchController.searchBar.autocapitalizationType = .none
        //实时搜索
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        //默认显示searchbar
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private var searchResultsController: SearchResultsViewController? {
        return navigationItem.searchController?.searchResultsController as? SearchResultsViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "asd", for: indexPath)
//        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

}
// MARK: - UISearchBarDelegate
//extension TableViewController : UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        search(searchBar.text)
//    }
//}

// MARK: - UISearchControllerDelegate
extension TableViewController : UISearchControllerDelegate {
//    func didDismissSearchController(_ searchController: UISearchController) {
//        tableView.reloadData()
//    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        searchResultsController?.reset()
    }
}

extension TableViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        search(searchController.searchBar.text)
    }
}
// MARK: - helpers
extension TableViewController {
    func search(_ text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        searchResultsController?.search(text, in: items)
    }
}

