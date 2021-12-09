//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import os.log

class ChatViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hello!"),
        Message(sender: "1@2.com", body: "Wha's up?!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        tableView.delegate = self
        tableView.dataSource = self
        title = Constant.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: Constant.cellNibName, bundle: nil), forCellReuseIdentifier: Constant.cellIdentifier)
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        guard let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email else { return }
        
        db.collection(Constant.FStore.collectionName).addDocument(data: [
            Constant.FStore.senderField : messageSender,
            Constant.FStore.bodyField : messageBody
        ]) { error in
            guard let error = error else { return os_log(.default, "Successfully saved data.") }
            
            os_log(.error, "Unexpected error: %@", [error])
        }
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for:  indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].body
        return cell
    }
    
    
}

//extension ChatViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//}
