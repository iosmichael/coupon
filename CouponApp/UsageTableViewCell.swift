//
//  UsageTableViewCell.swift
//  CouponApp
//
//  Created by Michael Liu on 3/5/17.
//  Copyright © 2017 Coupon. All rights reserved.
//

import UIKit

class UsageTableViewCell: UITableViewCell {

    static let height:CGFloat = 75
    
    @IBOutlet weak var getCouponBtn: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        getCouponBtn.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func getCoupon(_ sender: Any) {
        
    }
    
    class func getHeight() -> CGFloat{
        return height
    }

}

protocol CountDownTableViewCellDelegate {
    func getCouponBtnClicked()
}

class CountDownTableViewCell: UITableViewCell {
    
    static let height:CGFloat = 75
    
    @IBOutlet weak var getCouponBtn: UIButton!
    
    var delegate:CountDownTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDelegate(delegate:CountDownTableViewCellDelegate){
        self.delegate = delegate
    }
    
    func disableBtn(){
        self.backgroundColor = UIColor.init(red: 90/255.0, green: 90/255.0, blue: 90/255.0, alpha: 1)
        self.getCouponBtn.setImage(UIImage.init(named: "getBtn-inactive"), for: .disabled)
        self.getCouponBtn.isEnabled = false
    }
    
    @IBAction func getCouponBtnClicked(_ sender: Any) {
        self.delegate?.getCouponBtnClicked()
    }
    
    class func getHeight() -> CGFloat{
        return height
    }
    
}


class infoTableViewCell: UITableViewCell {
    static let height:CGFloat = 45
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var websiteURL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    class func getHeight() -> CGFloat{
        return height
    }
    
    func setInfoCell(icon:UIImage, content:String){
        self.icon.image = icon
        self.websiteURL.text = content
    }
}

class offerTableViewCell:UITableViewCell{
    static let height:CGFloat = 75
    
    @IBOutlet weak var offerText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    class func getHeight(detail:String) -> CGFloat{
        let labelWidth = UIScreen.main.bounds.width-8*2
        let font = UIFont.init(name: "HelveticaNeue", size: 16)
        return UILabel().calculateLabelHeight(labelWidth: labelWidth, content: detail, font: font!) + 8
    }
    
    func setOfferDetail(detail:String){
        self.offerText.text = detail
        self.setNeedsLayout()
    }
}

protocol toolsTableViewCellDelegate {
    func locationBtnClicked()
    func storeBtnClicked()
}

class toolsTableViewCell:UITableViewCell{
    
    static let height:CGFloat = 75
    
    @IBOutlet weak var timesOfUsageLabel: UILabel!
    
    var delegate:toolsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setDelegate(delegate:toolsTableViewCellDelegate){
        self.delegate = delegate
    }
    
    class func getHeight() -> CGFloat{
        return height
    }
    
    func setUsage(uses:String){
        self.timesOfUsageLabel.text = uses
    }
    
    @IBAction func storeClicked(_ sender: Any) {
        self.delegate?.storeBtnClicked()
    }
    @IBAction func locationClicked(_ sender: Any) {
        self.delegate?.locationBtnClicked()
    }
}


class imagesTableViewCell:UITableViewCell{
    
    let itemInRow: CGFloat = 3
    let itemMargins: CGFloat = 1
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (UIScreen.main.bounds.width - 4) / 3
        layout.sectionInset = UIEdgeInsets.init(top: itemMargins, left: itemMargins, bottom: itemMargins, right: itemMargins)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        self.collectionView.collectionViewLayout = layout
    }
    
    func setCollectionDelegate(delegate: UICollectionViewDelegate, datasource: UICollectionViewDataSource){
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = datasource
    }
    
    func getHeight() -> CGFloat{
        return self.frame.width
    }
    
}

class imageCollectionViewCell:UICollectionViewCell{
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImage(image:UIImage){
        self.thumbnail.image = image
        self.setNeedsLayout()
    }
}

