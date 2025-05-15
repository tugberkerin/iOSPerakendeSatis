

import Foundation

public struct Product {
    public let id: String // To keep track of items in CoreData and Cart
    public let name: String
    public let description: String
    public let price: Double
    public let imageSource: String

    
    public func getID() -> String {
        guard let first = name.components(separatedBy: " ").first
        else { return "NoIDObject" }

        return "\(first)\(Int(price))"
    }
}
