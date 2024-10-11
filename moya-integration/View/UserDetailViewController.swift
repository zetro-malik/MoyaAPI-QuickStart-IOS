//
//  UserDetailViewController.swift
//  moya-integration
//
//  Created by Creatives Solutions on 11/10/2024.
//

import UIKit

class UserDetailViewController: UIViewController {

    // MARK: Variables
    private let networkManager: NetworkManager = NetworkManager()
    private var user: User?
    var userId: Int = 0
    
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
  
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUsers(userId: userId)
    }
    
    private func setData(_ user: User) {
        userIdLabel.text = "Id: \(user.id)"
        titleLabel.text = "Title: \(user.title)"
    }
    
    
    // MARK: API Call
    private func loadUsers(userId: Int) {
        networkManager.fetchUserDetail(userId: userId, completion: { [weak self] result in
            switch result {
            case .success(let userResponse):
                self?.setData(userResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }


}
