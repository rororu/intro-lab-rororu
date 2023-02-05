import UIKit
import Foundation

class NewsFactory {
    private let strintgUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY"
    
    func getNews() -> [New] {
        var currentNews = [New]()
        
        guard let url = URL(string: strintgUrl) else {
            return currentNews
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "not")
                return
            }
            
            guard let data = data else { return }
            guard let news = try? JSONDecoder().decode(News.self, from: data) else {
                print("Error can`t parse News")
                return
            }
            currentNews = news.articles
        }
        
        task.resume()
        return currentNews
    }
}
