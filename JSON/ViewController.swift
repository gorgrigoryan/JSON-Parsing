//
//  ViewController.swift
//  JSON
//
//  Created by Gor Grigoryan on 10/27/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set tableView settings on UI
        setupTableView()
        // add searchController on navigationItem and configure settings
        setupSearchBar()
        
        // write url address in string constant
        let urlString = "https://itunes.apple.com/search?term=jack+johnson&limit=25"
        /*
        request(urlString: urlString) { (searchResponse, error) in
            searchResponse?.results.map({ (track) in
                print(track.trackName)
                })
        }
        */
        
        networkService.request(urlString: urlString) { (result) in
            switch result {
                
            case .success(let searchResponse):
                searchResponse.results.map { (track) in
                    print(track.trackName)
                }
            case .failure(let error):
                print("Error:", error)
            }
        }
    }

    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        // set "dark" theme on content, when click on searchBar
        searchController.obscuresBackgroundDuringPresentation = false
        // set navigation title in Large font
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "123"
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

