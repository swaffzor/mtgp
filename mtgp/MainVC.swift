//
//  ViewController.swift
//  mtgp
//
//  Created by Jeremy Swafford on 7/18/21.
//

import UIKit
import MTGSDKSwift

class MainVC: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("updating...")
    }
    
    let magic = Magic()
    let searchController = UISearchController()
    var searchActive = false
    var searchResults: [String] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        magic.fetchPageTotal = "1"
        magic.fetchPageSize = "100"
        
        searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let name = CardSearchParameter(parameterType: .name, value: searchText)
        guard searchActive == true else {return}
        magic.fetchCards([name]) {cards, error in
            self.searchResults = cards?.map{ (card) -> String in
                card.name ?? ""
            } ?? [""]
//            DispatchQueue.main.async {
//                self.tvSearch.reloadData()
//            }
            
            for c in cards! {
                print(c.name)
            }
        }
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = true
        searchBar.resignFirstResponder()
//        print("search button clicked")
    }
}
