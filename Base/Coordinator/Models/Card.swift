import Foundation
import UIKit

struct Card {
    
    var name: String
    let number: String
    var balance: String
    let backgroundColor: UIColor // упрощение
    var transactions: [Transaction]
}
