//
//  Dish+CoreDataClass.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 10/02/2023.
//
//

import Foundation
import CoreData

@objc(Dish)
public class Dish: NSManagedObject {
    func formatPrice() -> String {
        let spacing = price < 10 ? " " : ""
        return "$ " + spacing + String(format: "%.2f", price)
    }
}
