//
//  MessageTableViewCell.swift
//  CouponApp
//
//  Created by Michael Liu on 3/5/17.
//  Copyright © 2017 Coupon. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    static let height:CGFloat = 121
    
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMessage(message:Message){
        self.messageContent.text = message.content
        self.title.text = message.title
        self.date.text = message.date
    }
    
    class func getHeight(message:String)->CGFloat{
        let labelWidth = UIScreen.main.bounds.width - 18 - 18
        let actualHeight = UILabel().calculateLabelHeight(labelWidth: labelWidth, content: message, font: UIFont.init(name: "HelveticaNeue-Medium", size: 17)!) + 60.5
        return actualHeight > height ? actualHeight : height
    }
}
