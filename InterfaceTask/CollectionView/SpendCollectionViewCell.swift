//
//  SpendCollectionViewCell.swift
//  InterfaceTask
//
//  Created by vignesh kumar c on 02/02/22.
//

import UIKit
import Kingfisher
class SpendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: SpendCollectionViewCell.self)

    @IBOutlet weak var brandImage: UIImageView!
    @IBOutlet weak var notificationLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    
    
    
    func setup(expenses: ExpensiveDetails) {
    
        brandImage.kf.setImage(with: expenses.itemImage?.asUrl)
        notificationLbl.text = expenses.itemName
        dateLbl.text = expenses.date
        amountLbl.text = "₹" + expenses.itemPrice!
        statusLbl.text = expenses.status
        if statusLbl.text == "Approved" {
        statusLbl.layer.borderWidth = 1
        statusLbl.layer.borderColor = UIColor.green.cgColor
            statusLbl.textColor = .green
            
        } else{
            statusLbl.layer.borderWidth = 1
            statusLbl.layer.borderColor = UIColor.orange.cgColor
            statusLbl.textColor = .orange
        }
        
}
    

    
}
