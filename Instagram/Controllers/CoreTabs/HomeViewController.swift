//
//  ViewController.swift
//  Instagram
//
//  Created by Anthony Edward Heitzeberg on 7/30/21.
//

import Firebase
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Failed to sign out")
        }
    }
    
    private func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            // Show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}

