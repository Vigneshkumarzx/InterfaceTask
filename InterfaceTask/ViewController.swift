//
//  ViewController.swift
//  InterfaceTask
//
//  Created by vignesh kumar c on 02/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var monthlyBtn: UIButton!
    @IBOutlet weak var weeklyBtn: UIButton!
    @IBOutlet weak var dailyBtn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var ttlAmntLbl: UILabel!
    @IBOutlet weak var expensiveCollectionView: UICollectionView!
    
    
    
    var expensiveDetails:[ExpensiveDetails] = []
    
    var weeklyExpensiveDetails:[ExpensiveDetails] = [
      
        .init(itemImage: "https://i.pinimg.com/originals/3b/fb/e3/3bfbe3cfaab065615942f4b77595b762.jpg", itemName: "Uber Ride", date: "FEB 02,2022", itemPrice: "650", status: "Approved"),
            .init(itemImage: "https://miro.medium.com/max/1200/1*AdiawHSAn_LXYOxSSxfLNA.png", itemName: "Starbucks", date: "FEB 02,2022", itemPrice: "434", status: "pending"),
            .init(itemImage: "https://play-lh.googleusercontent.com/7g1mR_Od0qNRfiEN4MsSSKyb8d1MB3GrvShoKKOCrGituQ2d73IMcnim9J3lHlWDHJA", itemName: "Tickets New ", date: "FEB 02,2022", itemPrice: "500", status: "pending"),
            .init(itemImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Domino%27s_pizza_logo.svg/1200px-Domino%27s_pizza_logo.svg.png", itemName: "Dominos Pizza", date: "FEB 02,2022", itemPrice: "1050", status: "Approved"),
            .init(itemImage: "https://logopond.com/logos/e540d0738a465734593c9684ce898210.png", itemName: "BurgerHut", date: "FEB 02,2022", itemPrice: "750", status: "Approved")
    ]
    var DailyExpensiveDetails:[ExpensiveDetails] = [
      
        .init(itemImage: "https://i.pinimg.com/originals/3b/fb/e3/3bfbe3cfaab065615942f4b77595b762.jpg", itemName: "Uber Ride", date: "FEB 02,2022", itemPrice: "100", status: "Approved"),
            .init(itemImage: "https://miro.medium.com/max/1200/1*AdiawHSAn_LXYOxSSxfLNA.png", itemName: "Starbucks", date: "FEB 02,2022", itemPrice: "250", status: "pending"),
            .init(itemImage: "https://play-lh.googleusercontent.com/7g1mR_Od0qNRfiEN4MsSSKyb8d1MB3GrvShoKKOCrGituQ2d73IMcnim9J3lHlWDHJA", itemName: "Tickets New ", date: "FEB 02,2022", itemPrice: "180", status: "pending"),
            .init(itemImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Domino%27s_pizza_logo.svg/1200px-Domino%27s_pizza_logo.svg.png", itemName: "Dominos Pizza", date: "FEB 02,2022", itemPrice: "40", status: "Approved"),
            .init(itemImage: "https://logopond.com/logos/e540d0738a465734593c9684ce898210.png", itemName: "BurgerHut", date: "FEB 02,2022", itemPrice: "300", status: "Approved")
    
    ]
    
 
    var MonthlyExpensiveDetails:[ExpensiveDetails] = [
        .init(itemImage: "https://i.pinimg.com/originals/3b/fb/e3/3bfbe3cfaab065615942f4b77595b762.jpg", itemName: "Uber Ride", date: "FEB 02,2022", itemPrice: "1650", status: "Approved"),
            .init(itemImage: "https://miro.medium.com/max/1200/1*AdiawHSAn_LXYOxSSxfLNA.png", itemName: "Starbucks", date: "FEB 02,2022", itemPrice: "3434", status: "pending"),
            .init(itemImage: "https://play-lh.googleusercontent.com/7g1mR_Od0qNRfiEN4MsSSKyb8d1MB3GrvShoKKOCrGituQ2d73IMcnim9J3lHlWDHJA", itemName: "Tickets New ", date: "FEB 02,2022", itemPrice: "1500", status: "pending"),
            .init(itemImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Domino%27s_pizza_logo.svg/1200px-Domino%27s_pizza_logo.svg.png", itemName: "Dominos Pizza", date: "FEB 02,2022", itemPrice: "1250", status: "Approved"),
            .init(itemImage: "https://logopond.com/logos/e540d0738a465734593c9684ce898210.png", itemName: "BurgerHut", date: "FEB 02,2022", itemPrice: "2750", status: "Approved")
      ]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        expensiveCollectionView.delegate = self
        expensiveCollectionView.dataSource = self
        
        let shape = CAShapeLayer()
        self.view.layer.addSublayer(shape)
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.blue.cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: (3*view.bounds.height)/4))
        path.addLine(to: CGPoint(x: self.view.bounds.width, y: view.bounds.height/2))
        path.addLine(to: CGPoint(x: self.view.bounds.width, y: 0))
        path.close()
        shape.path = path.cgPath
        
        view.bringSubviewToFront(btnView)
        view.bringSubviewToFront(descriptionLbl)
        view.bringSubviewToFront(ttlAmntLbl)
        view.bringSubviewToFront(expensiveCollectionView)
        registerCells()
       monthlyBtnTapped(monthlyBtn)
      
    }

    private func registerCells() {
        self.expensiveCollectionView.register(UINib(nibName: "SpendCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"SpendCollectionViewCell")
    }

    @IBAction func monthlyBtnTapped(_ sender: UIButton) {
    
        weeklyBtn.backgroundColor =  UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        dailyBtn.backgroundColor =  UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        sender.backgroundColor = .white
        monthlyBtn.tintColor = .black
        
        expensiveDetails = MonthlyExpensiveDetails
        expensiveCollectionView.reloadData()
        
        let monthlyTtl =  MonthlyExpensiveDetails.map(\.itemPrice).compactMap{$0}.map{Double($0)}.reduce(0.0){$0 + ($1 ?? 0)}
        
        ttlAmntLbl.text = "₹" + String(monthlyTtl)
    }
    
    @IBAction func weeklyBtnTapped(_ sender: UIButton) {
        monthlyBtn.backgroundColor =  UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        weeklyBtn.backgroundColor =   UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        dailyBtn.backgroundColor =  UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        sender.backgroundColor = .white
        weeklyBtn.tintColor = .black
        
        expensiveDetails = weeklyExpensiveDetails
        expensiveCollectionView.reloadData()
        
        let weeklyTtl =  weeklyExpensiveDetails.map(\.itemPrice).compactMap{$0}.map{Double($0)}.compactMap{$0}.reduce(0.0){$0 + $1}

        ttlAmntLbl.text = "₹" + String(weeklyTtl)
    }
    
    @IBAction func dailyBtnTapped(_ sender: UIButton) {
        monthlyBtn.backgroundColor =  UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        weeklyBtn.backgroundColor =   UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        dailyBtn.backgroundColor =  UIColor(red: 112, green: 130, blue: 250,alpha: 0)
        sender.backgroundColor = .white
        dailyBtn.tintColor = .black
        
        expensiveDetails = DailyExpensiveDetails
        expensiveCollectionView.reloadData()
        
        let weeklyTtl =  DailyExpensiveDetails.map(\.itemPrice).compactMap{$0}.map{Double($0)}.reduce(0.0){$0 + ($1 ?? 0)}
        
        ttlAmntLbl.text = "₹" + String(weeklyTtl)
        
    }
  
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         CGSize(width: 150, height: 355)
    }
            
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
       return expensiveDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpendCollectionViewCell", for: indexPath) as! SpendCollectionViewCell
        cell.setup(expenses: expensiveDetails[indexPath.row])
        return cell
    }
    
    
}
