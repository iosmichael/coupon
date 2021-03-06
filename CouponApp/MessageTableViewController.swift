//
//  MessageTableViewController.swift
//  CouponApp
//
//  Created by Michael Liu on 3/5/17.
//  Copyright © 2017 Coupon. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {

    var messages:[Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "message", for: indexPath) as! MessageTableViewCell
        let message = messages[indexPath.row]
        cell.setMessage(message: message)
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeaderView()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MessageTableViewCell.getHeight(message: messages[indexPath.row].title)
    }
    
    func getHeaderView() -> UIView {
        let screenBounds:CGRect = self.view.frame
        let sectionView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenBounds.width, height: 50))
        sectionView.backgroundColor = .white
        let imageView = UIImageView.init(frame: CGRect.init(x: 15, y: 13, width: 22, height: 24))
        imageView.image = UIImage.init(named: "story")!
        let labelText = UILabel.init(frame: CGRect.init(x: 15 * 2 + 22, y: 10, width: screenBounds.width, height: 30))
        labelText.text = "Message"
        labelText.textColor = .black
        labelText.font = UIFont.init(name: "HelveticaNeue-Medium", size: 23)
        sectionView.addSubview(imageView)
        sectionView.addSubview(labelText)
        return sectionView
    }

    func setupData(){
        let messageManager = MessageManager()
        messageManager.queryNewMessages(limit: 100).observe(.value, with: { (snapshot) in
            self.messages = messageManager.getMessages(snapshot: snapshot)
            self.tableView.reloadData()
        })
    }
    
}
