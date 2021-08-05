//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Anthony Edward Heitzeberg on 7/30/21.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if username and email is available
    /// - Parameters
    ///     -email: String representing email
    ///     -username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Inserts new user data to database
    /// - Parameters
    ///     -email: String representing email
    ///     -username: String representing username
    ///     -completion: Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, userName: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        database.child(email.safeDatabaseKey()).setValue(["username": userName]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
}
