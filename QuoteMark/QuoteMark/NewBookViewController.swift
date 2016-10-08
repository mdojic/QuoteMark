//
//  NewBookViewController.swift
//  QuoteMark
//
//  Created by Milan Dojic on 10/7/16.
//  Copyright © 2016 Milan Dojic. All rights reserved.
//

import Foundation
import UIKit


class NewBookViewController : UIViewController {
    
    enum InfoType {
        case BookName
        case AuthorName
    }
    
    // Reference to the book name input
    @IBOutlet weak var bookNameInput: UITextField!
    
    // Reference to the author name input
    @IBOutlet weak var authorNameInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /* --------------------- Click handlers for this view controller --------------------- */
    
    // Called when <Save> button is clicked
    @IBAction func saveButtonClicked(sender: AnyObject) {
        
        // Get values from input fields
        let bookName = bookNameInput.text
        let authorName = authorNameInput.text
        
        // Check if user has entered all info - if he hasn't, notify him and stop save execution
        if (bookName == "") {
            showMissingInfoAlert(.BookName)
            return
        }
        
        if (authorName == "") {
            showMissingInfoAlert(.AuthorName)
            return
        }
        
        
        
        
    }
    
    // Called when <Cancel> button is clicked
    @IBAction func cancelButtonClicked(sender: AnyObject) {
        dismissView()
    }
    
    
    
    /* --------------------- Private utility methods for this view controller --------------------- */
    
    // Close this view
    private func dismissView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // Show alert about missing info
    private func showMissingInfoAlert(missingInfoType: InfoType) {
        
        var missingInfo = ""
        
        switch (missingInfoType) {
            case .BookName: missingInfo = "Book Name"
            case .AuthorName: missingInfo = "Author Name"
        }
        
        let alertController = UIAlertController(title: "Missing Info", message: "Please fill the \(missingInfo) field before saving", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}