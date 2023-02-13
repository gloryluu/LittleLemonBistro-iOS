//
//  MenuRepository.swift
//  little-lemon-bistro
//
//  Created by Quang Luu on 10/02/2023.
//

import Foundation
import CoreData

@MainActor
class MenuRepository: ObservableObject {
    
    @Published var menuItems = [MenuItem]()
        
    func reload(_ coreDataContext:NSManagedObjectContext) async {
        let url = URL(string: "https://raw.githubusercontent.com/gloryluu/LittleLemonBistro-iOS/0da6ca76e923808d0bf9045bf6b8127298f61dd9/menu-list.json")!
        let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let fullMenu = try JSONDecoder().decode(JSONMenu.self, from: data)
            menuItems = fullMenu.menu
            
            // populate Core Data
//            Dish.deleteAll(coreDataContext)
            Dish.createDishesFrom(menuItems:menuItems, coreDataContext)
        }
        catch {
            NSLog(error.localizedDescription)
        }
    }
}

