import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {

        for menuItem in menuItems {
            guard let exists = exists(name: menuItem.name, context), exists == false else {
                continue
            }

            let oneDish = Dish(context: context)

            oneDish.name = menuItem.name
            oneDish.price = menuItem.price
            oneDish.desc = menuItem.description
            oneDish.imageURL = menuItem.imageURL
            oneDish.category = menuItem.category
        }

    }
    
}
