//
//  SearchTableViewController.swift
//  Lexical
//
//  Created by Floriane Sanchis on 08/10/2017.
//  Copyright © 2017 Floriane Sanchis. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var keyboardDismissTapGesture : UIGestureRecognizer?
    
    var wordOfList = ["france.png", "germany.png","china.png","united-kingdom.png","switzerland.png","canada.png"]
    var filteredWord = [String]()
    
    var isSearching = false
    var cancelButton : UIButton!
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Put the searchbar inside navigationBar
        navigationBar.titleView = searchBar
        
        btnMenu.target = self
        //Auto-focus
        searchBar.becomeFirstResponder()
        
        //Always enables the cancel button of the searchBar
        cancelButton = searchBar.value(forKeyPath: "cancelButton") as! UIButton
        cancelButton.isEnabled = true
        cancelButton.tintColor = UIColor.black
        
        if revealViewController() != nil
        {
             hideKeyboardWhenTappedArround(searchBar: searchBar)
        }
        
        //Filter when text is done
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Returns true if the searchBar text is empty or nil
    func searchBarIsEmpty() -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    //Search word
    func filterContentForSearchText(searchText: String, scope: String = "All")
    {
        filteredWord = wordOfList.filter{word in
            return word.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    //When cancel button is clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        //Call the mainStoryBoard
        let mainStoryboard:UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        
        //Creation of UIViewController
        let desController = mainStoryboard.instantiateViewController(withIdentifier: "DisplaySpecificListViewController") as! DisplaySpecificListViewController
        
        //Return to DisplaySpecificListViewController
        navigationController?.pushViewController(desController, animated: false)
    }
    
    // Return the number of sections
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    //Return the number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching
        {
            return filteredWord.count
        }
        return wordOfList.count
    }
    
    //Return the name of list, theme sous theme etc related to what is seletectionned
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Name list"
    }
    
    //Display the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lexicalSearchTableViewCell", for: indexPath) as! LexicalSearchTableViewCell
        
        let word : String!
        
        if isSearching
        {
            word = filteredWord[indexPath.row]
        }
        else
        {
            word = wordOfList[indexPath.row]
        }
        
        cell.nameWord?.text = word
        cell.traductionWord?.text = "Traduction word"
        addRecognizerToLearn(imgToLearn: cell.imgToLearn!)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBarIsEmpty()
        {
            isSearching = false            
            tableView.reloadData()
        }
        else
        {
            isSearching = true
            filterContentForSearchText(searchText: searchBar.text!)
        }
    }
    
    //When an item is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Remove focus of the searchBar
        searchBar.endEditing(true)
        //Kept the cancel button enable
        cancelButton.isEnabled = true
    }

    //Open menu and hide the keyboard if it is active
    @IBAction func openMenu()
    {
        searchBar.endEditing(true)
        //Load the menu button
        if revealViewController() != nil
        {
            revealViewController().revealToggle(animated: true)
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        //Kept the cancel button enable
        cancelButton.isEnabled = true
    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

