//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    let db = Firestore.firestore();
    
    var messages: [Message] = [
        Message(sender: "1", body: "Hello guys this is a really long message lol lol this is still a long message thhhahahahaha"),
        Message(sender: "2", body: "Hey whats up"),
        Message(sender: "1", body: "Hello guys"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = "FlashChat!"
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
        
    }
    
    func loadMessages() {
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            
            self.messages = [];
            if error != nil {
                print("There was an issue retrieving data from firestore.")
            } else {
                
                if let snapShotDocuments = querySnapshot?.documents {
                    for doc in snapShotDocuments {
                        
                        
                        let data = doc.data();
                        if let sender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            self.messages.append(Message(sender: sender, body: messageBody));
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData();
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0);
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text,
           let sender = Auth.auth().currentUser?.email {
            
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField : sender,
                K.FStore.bodyField : messageBody,
                K.FStore.dateField : Date().timeIntervalSince1970,
            ]) { (error) in
                if error != nil {
                    print("There was an issue saving data to firestore")
                } else {
                    print("WORKED!")
                    DispatchQueue.main.async {
                        
                        self.messageTextfield.text = ""   
                    }
                    
                }
            };
        }
    }
    
    @IBAction func onLogOut(_ sender: UIBarButtonItem) {
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
        return messages.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messages = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label?.text = messages.body
        
        if messages.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true;
            cell.rightImageView.isHidden = false;
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false;
            cell.rightImageView.isHidden = true;
        }
        return cell;
    }
    
}

extension ChatViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
