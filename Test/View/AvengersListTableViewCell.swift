//
//  AvengersListTableViewCell.swift
//  Test
//
//  Created by HEXA-Calvin.Goh on 14/04/2024.
//

import UIKit

class AvengersListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avengersImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var item: AvengersModel! {
        didSet {
            setAvengersData()
        }
    }

    private func setAvengersData() {
        avengersImageView.image = UIImage(named: item.imageName)
        titleLabel.text = item.title
        ratingsLabel.text = item.rating
    }
}
