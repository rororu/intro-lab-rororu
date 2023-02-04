import UIKit
import Foundation

protocol NewsProtocol {
    var title: String? {get set}
    var urlToImage: String? {get set}
    var description: String? {get set}
    var url: String? {get set}
    var nameNewspaper: String? {get set}
    var content: String? {get set}
    var publishedAt: String? {get set}
    var author: String? {get set}
}

struct News: Decodable, NewsProtocol {
    var title: String?
    var url: String?
    var urlToImage: String?
    var description: String?
    var nameNewspaper: String?
    var content: String?
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
