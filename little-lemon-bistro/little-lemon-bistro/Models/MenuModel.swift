import Foundation

struct JSONMenu: Decodable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

struct MenuItem: Decodable, Hashable, Identifiable {
    let id = UUID()
    let name: String
    let price: Float
    let description: String
    let imageURL: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case name, price, description, category
        case imageURL = "image"
    }
}
