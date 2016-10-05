//
//  BookListViewController.swift
//  QuoteMark
//
//  Created by Milan Dojic on 9/24/16.
//  Copyright © 2016 Milan Dojic. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var books = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    // Koliko redova ima tabela
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // Vraca sadrzaj reda tabele na datom indeksu
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let cell = UITableViewCell()
        cell.textLabel!.text = "Yo b00raz"
        return cell
    }
    
    // Akcija za izvrsavanje kada se selektuje red tabele
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        // TODO: Open view controller listing quotes for this book
    }
}

