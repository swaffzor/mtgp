//
//  SearchResultsViewController.swift
//  mtgp
//
//  Created by Jeremy Swafford on 7/19/21.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tvSearch: UITableView!
    var searchResults: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvSearch.delegate = self
        tvSearch.dataSource = self
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
