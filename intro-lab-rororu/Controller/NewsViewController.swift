import UIKit

class NewsViewController: UITableViewController {
    //MARK: - Свойства
    var news: [New?] = []
    /*private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsViewCell.self, forCellReuseIdentifier: NewsViewCell.identifier)
        
        return tableView
    }()*/
    
    
    //MARK: - Жизненный цикл контроллера
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApi()
        
        tableView.register(NewsViewCell.self, forCellReuseIdentifier: NewsViewCell.identifier)
        tableView.separatorStyle = .none
        
        //view.addSubview(tableView)
        //tableView.dataSource = self
    }
    
    
    
    //MARK: - Методы контроллера
    func getApi() {
        let stringUrl = "https://newsdata.io/api/1/news?apikey=pub_1664146ef7b22a0f6098e91c393f179cdd791&q=pegasus&language=en"
        
        //let stringUrl = "https://newsdata.io/api/1/news?apikey=pub_1664146ef7b22a0f6098e91c393f179cdd791&q=black%20fungus"
        guard let url = URL(string: stringUrl) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print(error?.localizedDescription ?? "no")
                return
            }
            
            guard let data = data else {return}
            
            guard let news = try? JSONDecoder().decode(News.self, from: data) else {
                print("Error news")
                return
            }
            DispatchQueue.main.async {
                self.news = news.results
                self.tableView.reloadData()
                //print(news.results.count)
                print(self.news.count)
                print(news.status)
            }

        }
        task.resume()
    }
    
    
    private func getConfiguredNewsCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.identifier, for: indexPath) as! NewsViewCell
        guard let currentNews = news[indexPath.row] else {
            return cell
        }
        
        cell._titleView?.text = currentNews.title ?? "Not title"
        cell._viewsView?.text = "Просмотров: \(cell.getViews())"
        cell._newspaperView?.text = currentNews.creator?[0] ?? "Not creator"
        
        let stringUrlImage = currentNews.image_url ?? "Not image"
        
        guard let url = URL(string: stringUrlImage) else {
            return cell
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                cell._imageView?.image = image
            }
        }
        task.resume()
        
        return cell
    }
    
    private func getBildingCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.identifier, for: indexPath) as! NewsViewCell
         
        
        cell._viewsView?.text = "Просмотров: \(cell.getViews())"
        cell._newspaperView?.text = "Ria news"
        cell._titleView?.text = "You can do individual cells. I want testing my new cell (All ready cell and image)You can do individual cells. I want testing my new cell (All ready cell and image)"
        
        
        let stringUrl = "https://images.unsplash.com/profile-1446404465118-3a53b909cc82?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32&s=a2f8c40e39b8dfee1534eb32acfa6bc7"
        
        guard let url = URL(string: stringUrl) else {
            print("Error: url not founded")
            return cell
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                cell._imageView?.image = image
            }
        }
        task.resume()
        
        return cell
    }
    
    // MARK: - Методы Table view
    
    /*override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }*/
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "News"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getConfiguredNewsCell(for: indexPath)
        //return getBildingCell(for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextViewController = SearchNewViewController()
        
        //self.present(nextViewController, animated: true)
        guard let currentCell = self.tableView.cellForRow(at: indexPath) as? NewsViewCell else {
            fatalError("Not cell")
        }
        
        currentCell.addViews()
        
        let descriptionText = news[indexPath.row]?.description ?? "Not description"
        let link = news[indexPath.row]?.link ?? ""
        nextViewController.settingText(titleText: currentCell._titleView?.text ?? "No title",
                                       descriptionText: descriptionText,
                                       creatorText: currentCell._newspaperView?.text ?? "o creator",
                                       buttonText: link,
                                       image: currentCell._imageView?.image ?? UIImage())
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

/*extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //return getConfiguredNewsCell(for: indexPath)
        return getBildingCell(for: indexPath)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}*/
