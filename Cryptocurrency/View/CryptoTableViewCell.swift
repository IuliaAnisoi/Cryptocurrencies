//
//  CryptoTableViewCell.swift
//  Cryptocurrency
//
//  Created by Iulia Anisoi on 16.07.2021.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.backgroundColor = UIColor.clear.cgColor
            containerView.layer.shadowOpacity = 1
            containerView.layer.shadowRadius = 2
            containerView.layer.shadowColor = UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1.00).cgColor
            containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
          
        }
    }
    
    @IBOutlet weak var clippingView: UIView! {
        didSet {
            clippingView.layer.cornerRadius = 10
            clippingView.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.00)
            clippingView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var changes7DaysLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func update(with crypto: CoinData){
        rankLabel.text = "#\(crypto.rank ?? 0)"
        coinNameLabel.text = crypto.name
        symbolLabel.text = crypto.symbol
        priceLabel.text = "$\(crypto.description )"
        
        changes7DaysLabel.textColor = (crypto.percentChange7D ?? "").contains("-") ? .red : UIColor(displayP3Red: 0/255, green: 153/255, blue: 0/255, alpha: 1.00)
        changes7DaysLabel.text = crypto.percentChange7D
    }

}
