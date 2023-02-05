import UIKit
import Foundation

// Протокол новостей

protocol NewProtocol {
    var name: String? {get set}
    var urlToImage: String? {get set}
    var description: String? {get set}
    var url: String? {get set}
    var nameNewspaper: String? {get set}
    var publishedAt: String? {get set}
    var author: String? {get set}
}

// Cтруктуры новостей

struct New: Decodable, NewProtocol {
    var name: String?
    var url: String?
    var urlToImage: String?
    var description: String?
    var nameNewspaper: String?
    var publishedAt: String?
    var author: String?
    private var views: Int = 0
    
    func getViews() -> Int {
        return self.views
    }
    
    mutating func addViews() {
        self.views += 1
    }
}

struct News: Decodable {
    var articles: [New]
}
