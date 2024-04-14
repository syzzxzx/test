//
//  DetailsViewController.swift
//  Test
//
//  Created by HEXA-Calvin.Goh on 14/04/2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var avengersImageView: UIImageView!
    @IBOutlet weak var normalStar: UIImageView!
    @IBOutlet weak var goodStar: UIImageView!
    @IBOutlet weak var awesomeStar: UIImageView!
    
    @IBAction func onNormalButtonTapped(_ sender: Any) {
        self.normalStar.image = UIImage(named: "star-2")
        self.goodStar.image = UIImage(named: "star")
        self.awesomeStar.image = UIImage(named: "star")
        NotificationCenter.default.post(name: .onRatingsUpdated, object: ["avenger": "\(avenger.title)", "rating": "Normal"])
    }
    
    @IBAction func onGoodStarButtonTapped(_ sender: Any) {
        self.normalStar.image = UIImage(named: "star-2")
        self.goodStar.image = UIImage(named: "star-2")
        self.awesomeStar.image = UIImage(named: "star")
        NotificationCenter.default.post(name: .onRatingsUpdated, object: ["avenger": "\(avenger.title)", "rating": "Very good"])
    }
    
    @IBAction func onAwesomeButtonTapped(_ sender: Any) {
        self.normalStar.image = UIImage(named: "star-2")
        self.goodStar.image = UIImage(named: "star-2")
        self.awesomeStar.image = UIImage(named: "star-2")
        NotificationCenter.default.post(name: .onRatingsUpdated, object: ["avenger": "\(avenger.title)", "rating": "Awesome"])
    }
    
    private let viewModel = AvengersViewModel()
    
    var avenger = AvengersModel(imageName: "", title: "", rating: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = false
        self.navigationController?.isNavigationBarHidden = false
        
        self.setupView()
    }
    
    func setupView() {
        self.avengersImageView.image = UIImage(named: avenger.imageName)
    }
}
