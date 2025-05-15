

import Foundation

public func with<Item>(_ item: Item, _ closure: (Item) -> Void) -> Item {
    closure(item)
    return item
}
