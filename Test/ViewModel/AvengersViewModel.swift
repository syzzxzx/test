//
//  ProductViewModel.swift
//  Test
//
//  Created by HEXA-Calvin.Goh on 12/04/2024.
//

import Foundation
import RxSwift
import RxCocoa

struct AvengersViewModel {
    var avengers = PublishSubject<[AvengersModel]>()
    
    func fetchItems() {
        let avengerList = [
            AvengersModel(imageName: "superman", title: "Super man", rating: "Very good"),
            AvengersModel(imageName: "avenger_ironman", title: "Iron man", rating: "Normal"),
            AvengersModel(imageName: "avenger_hulk", title: "Hulk", rating: "Awesome"),
        ]
        
        avengers.onNext(avengerList)
    }
    
    func updateItems(title: String, rating: String) {
        var avengerList = [
            AvengersModel(imageName: "superman", title: "Super man", rating: "Very good"),
            AvengersModel(imageName: "avenger_ironman", title: "Iron man", rating: "Normal"),
            AvengersModel(imageName: "avenger_hulk", title: "Hulk", rating: "Awesome"),
        ]
        
        avengerList = avengerList.map({ (item) in
            var avenger = item
            if (avenger.title == title) {
                avenger.rating = rating
            }
            return avenger
        })
        
        avengers.onNext(avengerList)
    }
}
