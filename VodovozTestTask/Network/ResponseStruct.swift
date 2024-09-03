import Foundation
struct Response: Codable {
    let status: String
    let message: String
    let tovary: [Tovary]
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case tovary = "TOVARY"
    }
}

struct Tovary: Codable {
    let id: Int
    let name: String
    let data: [TovaryData]
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "NAME"
        case data
    }
}

struct TovaryData: Codable {
    let imageURL: String?
    let prices: [Price]
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "DETAIL_PICTURE"
        case prices = "EXTENDED_PRICE"
    }
}

struct Price: Codable {
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case price = "PRICE"
    }
}
