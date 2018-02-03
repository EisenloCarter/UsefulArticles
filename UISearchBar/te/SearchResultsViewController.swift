//
//  SearchResultsViewController.swift
//  te
//
//  Created by spidepa on 1/2/18.
//  Copyright © 2018年 spidepa. All rights reserved.
//

import UIKit

class SearchResultsViewController: UITableViewController {

    private var results = [NSAttributedString]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func search(_ text: String, in items: [String]) {
        results = items.flatMap { item in
            let matchedRange = (item as NSString).range(of: text, options: .caseInsensitive)
            guard matchedRange.location != NSNotFound else {
                return nil
            }
            return highlighted(string: item, in: matchedRange)
        }
    }
    
    private func highlighted(string s: String, in range: NSRange) -> NSAttributedString {
        let s = NSMutableAttributedString(string: s)
        s.beginEditing()
        let highlightAttributes: [NSAttributedStringKey : Any] = [
            .foregroundColor : UIColor.blue,
            .font : UIFont.boldSystemFont(ofSize: 17),
            ]
        s.addAttributes(highlightAttributes, range: range)
        s.endEditing()
        return s
    }
    
    func reset() {
        results.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "asdf", for: indexPath)
        cell.textLabel?.attributedText = results[indexPath.row]
        return cell
    }


}
