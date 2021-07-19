//
//  ViewController.swift
//  mtgp
//
//  Created by Jeremy Swafford on 7/18/21.
//

import UIKit
import MTGSDKSwift

class MainVC: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    let magic = Magic()
    var searchActive = false
    var searchResults: [String] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tvSearch: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        magic.fetchPageTotal = "1"
        magic.fetchPageSize = "100"
        
        searchBar.delegate = self
        tvSearch.delegate = self
        tvSearch.dataSource = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let name = CardSearchParameter(parameterType: .name, value: searchText)
        guard searchActive == true else {return}
        magic.fetchCards([name]) {cards, error in
            self.searchResults = cards?.map{ (card) -> String in
                card.name ?? ""
            } ?? [""]
            DispatchQueue.main.async {
                self.tvSearch.reloadData()
            }
            
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

    func numberOfSections(in tableView: UITableView) -> Int {
        searchResults.count > 0 ? 1 : 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") ?? UITableViewCell()
        cell.textLabel?.text = searchResults[indexPath.row]
        
        return cell
    }
}
