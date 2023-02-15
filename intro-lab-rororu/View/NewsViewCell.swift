import UIKit

class NewsViewCell: UITableViewCell {
    //MARK: - Свойства и объекты
    
    static let identifier = "news"
    private var views: Int = 0 {
        didSet {
            setNeedsDisplay(CGRect(x: _viewsView!.frame.origin.x,
                                   y: _viewsView!.frame.origin.y,
                                   width: _viewsView!.frame.size.width,
                                   height: _viewsView!.frame.size.height))
        }
    }
    
    lazy var _imageView: UIImageView? = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var _titleView: UILabel? = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 15, weight: .bold)
        title.textColor = .black
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        
        return title
    }()
    
    lazy var _newspaperView: UILabel? = {
        let newspaper = UILabel()
        
        newspaper.font = .systemFont(ofSize: 11, weight: .light)
        newspaper.textColor = .gray
        
        return newspaper
    }()
    
    lazy var _viewsView: UILabel? = {
        let views = UILabel()
        
        views.font = .systemFont(ofSize: 11, weight: .light)
        views.textColor = .gray
        
        return views
    }()
    
    //MARK: - Инициализаторы
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(_titleView!)
        contentView.addSubview(_newspaperView!)
        contentView.addSubview(_imageView!)
        contentView.addSubview(_viewsView!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Методы и функции
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 5
        
        _imageView?.frame = CGRect(x: margin,
                                   y: margin,
                                   width: 100,
                                   height: contentView.frame.height - margin * 2)
        
        _newspaperView?.frame = CGRect(x: (_imageView?.frame.size.width ?? margin) + margin * 2,
                                       y: contentView.frame.size.height - margin - 10,
                                       width: (contentView.frame.width - (_imageView?.frame.size.width ?? margin) - margin * 4) / 2,
                                       height: 10)
        
        _viewsView?.frame = CGRect(x: (_imageView?.frame.size.width ?? margin) + (_newspaperView?.frame.size.width ?? margin) + margin * 3,
                                   y: contentView.frame.size.height - margin - 10,
                                   width: (_newspaperView?.frame.size.width ?? contentView.frame.width - (_imageView?.frame.size.width ?? margin) - margin * 4),
                                   height: 10)
        
        _titleView?.frame = CGRect(x: (_imageView?.frame.size.width ?? margin) + margin * 2,
                                   y: margin,
                                   width: contentView.frame.size.width - (_imageView?.frame.size.width ?? margin) - margin * 3,
                                   height: contentView.frame.size.height - (_viewsView?.frame.size.height ?? margin) - margin * 2)
    }
    
    override func draw(_ rect: CGRect) {
        _viewsView!.text = "Просмотров: \(views)"
    }
    
    func getViews() -> Int {
        return self.views
    }
    
    func addViews() {
        self.views += 1
    }

}
