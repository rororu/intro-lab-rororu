import WebKit
import UIKit

class WebViewController: UIViewController {
    private var urlString = ""
    
    lazy var webView: WKWebView = {
        let web = WKWebView()
        
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        DispatchQueue.main.async {
            self.loadWebView()
        }
    }

    override func viewDidLayoutSubviews() {
        webView.frame = self.view.bounds
    }
    
    func getWebUrl(urlString: String) {
        self.urlString = urlString
    }
    
    private func loadWebView() {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
}
