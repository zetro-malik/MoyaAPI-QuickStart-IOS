//
//  UsersViewController.swift
//  moya-integration
//
//  Created by Creatives Solutions on 11/10/2024.
//

import UIKit

class UsersViewController: UIViewController {
    
    // MARK: Variables
    private let networkManager: NetworkManager = NetworkManager()
    private var users: [User] = []
    
    // MARK: IBOutlets

    
    // MARK: - View lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Users"
        
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
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

}
