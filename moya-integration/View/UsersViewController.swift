//
//  UsersViewController.swift
//  moya-integration
//
//  Created by Creatives Solutions on 11/10/2024.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables
    private let networkManager: NetworkManager = NetworkManager()
    private var users: [User] = []
    
    // MARK: IBOutlets
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: - View lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Users"
        tableview.delegate = self
        tableview.dataSource = self
        
        loadUsers();

    }
    
    // MARK: API Call
    
    private func loadUsers() {
        print("API calling")
        networkManager.fetchUsers { [weak self] result in
            switch result {
            case .success(let userResponse):
                print("this is the response")
                print(userResponse);
                self?.users = userResponse
                self?.tableview.reloadData();
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    // MARK: Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ??
        UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.text = users[indexPath.row].title
        return cell
    }
    
    
    

}
