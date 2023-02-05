import UIKit

class NewsViewCell: UITableViewCell {
    //MARK: - Свойства и объекты
    
    static let identifier = "news"
    
    lazy var _imageView: UIImageView? = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 5
        
        return imageView
    }()
    
    lazy var _titleView: UILabel? = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 17, weight: .bold)
        title.textColor = .black
        
        return title
    }()
    
    lazy var _newspaperView: UILabel? = {
        let newspaper = UILabel()
        
        newspaper.font = .systemFont(ofSize: 10, weight: .light)
        newspaper.textColor = .systemGray4
        
        return newspaper
    }()
    
    lazy var _viewsView: UILabel? = {
        let views = UILabel()
        
        views.font = .systemFont(ofSize: 10, weight: .light)
        views.textColor = .systemGray4
        
        return views
    }()
    
    //MARK: - Инициализаторы
    
    required init(style: UITableViewCell.CellStyle, reuseIdentifire: String?, image: UIImage) {
        super.init(style: style, reuseIdentifier: reuseIdentifire)
        
        self._imageView?.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Методы и функции
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 2
        
        _imageView?.frame = CGRect(x: margin,
                                   y: margin,
                                   width: 50,
                                   height: contentView.frame.height - margin * 2)
        
        _newspaperView?.frame = CGRect(x: (_imageView?.frame.size.width ?? margin) + margin * 2,
                                       y: contentView.frame.size.height - margin - 10,
                                       width: (contentView.frame.width - (_imageView?.frame.size.width ?? margin) - margin * 3) / 2,
                                       height: 10)
        
        _viewsView?.frame = CGRect(x: contentView.frame.size.width - (_imageView?.frame.size.width ?? margin) - (_newspaperView?.frame.size.width ?? margin) - margin * 3,
                                   y: contentView.frame.size.height - margin - 10,
                                   width: (_newspaperView?.frame.size.width ?? margin) - margin,
                                   height: 10)
        
        _titleView?.frame = CGRect(x: (_imageView?.frame.size.width ?? margin) + margin * 2,
                                   y: margin,
                                   width: contentView.frame.size.width - (_imageView?.frame.size.width ?? margin) - margin * 3,
                                   height: contentView.frame.size.height - (_viewsView?.frame.size.height ?? margin) - margin * 2)
    }

}
