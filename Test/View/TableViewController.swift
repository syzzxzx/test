//
//  ViewController.swift
//  Test
//
//  Created by HEXA-Calvin.Goh on 12/04/2024.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    private let viewModel = AvengersViewModel()
    
    @objc func onRatingsUpdated(notification: NSNotification) {
        var title = String()
        var rating = String()
        
        if let dict = notification.object as? NSDictionary {
            if let avenger = dict["avenger"] as? String{
                title = avenger
            }
            if let avengerRating = dict["rating"] as? String{
                rating = avengerRating
            }
        }
        viewModel.updateItems(title: title, rating: rating)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(onRatingsUpdated(notification:)), name: .onRatingsUpdated , object: nil)
        
        tableView.rx.setDelegate(self).disposed(by: bag)
        bindTableView()
    }
    
    private func bindTableView() {
        tableView.register(UINib(nibName: "AvengersListTableViewCell", bundle: nil), forCellReuseIdentifier: "avengersCell")
        
        viewModel.avengers.asObservable().bind(to: tableView.rx.items(cellIdentifier: "avengersCell", cellType: AvengersListTableViewCell.self)) { (row,item,cell) in
            cell.item = item
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(AvengersModel.self).subscribe(onNext: { item in
            print("SelectedItem: \(item.rating)")
            let viewController = UIStoryboard(name: "Details", bundle: nil).instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
            viewController.avenger = item
            self.navigationController?.pushViewController(viewController, animated: true)
        }).disposed(by: bag)
        
        viewModel.fetchItems()
    }

}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
