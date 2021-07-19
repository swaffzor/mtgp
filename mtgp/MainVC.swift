//
//  ViewController.swift
//  mtgp
//
//  Created by Jeremy Swafford on 7/18/21.
//

import UIKit
import MTGSDKSwift

class MainVC: UIViewController, UISearchBarDelegate {
    let magic = Magic()
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        magic.fetchPageTotal = "1"
        magic.fetchPageSize = "100"
        
        searchBar.delegate = self
        
        let color = CardSearchParameter(parameterType: .colors, value: "green")
//        let cmc = CardSearchParameter(parameterType: .cmc, value: "2")
//        let setCode = CardSearchParameter(parameterType: .set, value: "AER")
        let name = CardSearchParameter(parameterType: .name, value: "elder g")
        magic.fetchCards([color, name]) {cards, error in
            if let error = error {
                //handle your error
            }

            for c in cards! {
                print(c.name)
            }

        }

    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("text changed")
        print(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search button clicketd")
    }
}

