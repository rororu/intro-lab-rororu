import UIKit
import Foundation

// Протокол новостей


// Cтруктуры новостей

struct New: Decodable {
    let title: String?
    let link: String?
    let creator: [String]?
    let description: String?
    let image_url: String?
    //let pubDate: String?
}

struct News: Decodable {
    let status: String
    let results: [New]
    //let totalResults: Int
}
