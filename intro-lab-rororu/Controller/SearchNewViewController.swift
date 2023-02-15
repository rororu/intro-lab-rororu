import WebKit
import UIKit

class SearchNewViewController: UIViewController {
    lazy var viewScreen: UIView? = {
        let view = UIView()
        view.bounds = self.view.bounds
        
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var imageScreen: UIImageView? = {
        
        let image = UIImageView()
        
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        return image
    }()
    
    lazy var titleScreen: UILabel? = {
        let lable = UILabel()
        
        lable.font = .systemFont(ofSize: 25, weight: .bold)
        settingLable(lable: lable)
        
        return lable
    }()
    
    var descriptionScreen: UILabel? = {
        let lable = UILabel()
        
        //settingLable(lable: lable)
        lable.font = .systemFont(ofSize: 18)
        
        return lable
    }()
    
    lazy var creator: UILabel = {
        let lable = UILabel()
        
        lable.font = .systemFont(ofSize: 18, weight: .medium)
        lable.textColor = .gray
        lable.backgroundColor = .green
        
        return lable
    }()
    
    lazy var webView: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(SearchNewViewController(), action: #selector(touchesButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewScreen?.addSubview(imageScreen!)
        viewScreen?.addSubview(titleScreen!)
        viewScreen?.addSubview(descriptionScreen!)
        viewScreen?.addSubview(creator)
        viewScreen?.addSubview(webView)
        
        self.view.addSubview(viewScreen!)
        
    }
    

    
    private func settingLable(lable: UILabel) {
        lable.numberOfLines = 0
        lable.lineBreakMode = .byWordWrapping
        lable.textColor = .black
    }
    
    final func settingText(titleText: String, descriptionText: String, creatorText: String, buttonText: String) {
        titleScreen?.text = titleText
        //titleScreen?.sizeToFit()
        
        if descriptionText != "Not description" {
            descriptionScreen?.text = descriptionText
        }
        
        creator.text = creatorText
        webView.setTitle(buttonText, for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        let margin: CGFloat = 10
        
        viewScreen?.frame = self.view.bounds
        
        imageScreen?.frame = CGRect(x: margin,
                                    y: (navigationController?.navigationBar.frame.size.height ?? 0) + topPadding,
                                    width: self.view.frame.size.width - margin * 2,
                                    height: 200)
        
        titleScreen?.frame = CGRect(x: margin,
                                    y: (imageScreen?.frame.size.height ?? 0) + (imageScreen?.frame.origin.y ?? 0) + margin,
                                    width: self.view.frame.size.width - margin,
                                    height: margin)
        titleScreen?.sizeToFit()
        
        descriptionScreen?.frame = CGRect(x: margin,
                                          y: (titleScreen?.frame.origin.y ?? topPadding) + (titleScreen?.frame.size.height ?? 0) + margin,
                                          width: self.view.frame.size.width - margin * 2,
                                          height: margin)
        descriptionScreen?.sizeToFit()
        
        creator.frame = CGRect(x: margin,
                               y: (descriptionScreen?.frame.origin.y ?? margin) + (descriptionScreen?.frame.size.height ?? margin) + margin,
                               width: self.view.frame.size.width - margin * 2,
                               height: creator.font.pointSize)
        
        webView.frame = CGRect(x: margin,
                               y: creator.frame.origin.y + creator.frame.size.height + margin,
                               width: self.view.frame.size.width - margin * 2,
                               height: 18)
        
    }
    
    @objc private func touchesButton(_ sender: UIButton) {
        let webViewController = WebViewController()
        
        webViewController.getWebUrl(urlString: webView.titleLabel?.text ?? "https://www.google.com/?client=safari")
        
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
}
