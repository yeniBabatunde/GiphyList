import UIKit
import SkeletonView
import Kingfisher

class MainViewCell: UITableViewCell {
    
    static let identifier = "cell"
    var giphy = [Giphy]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(gifImage)
        contentView.addSubview(gifTitle)
        configureGifImage()
        configureGifTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let gifImage: UIImageView = {
        let gifImage = UIImageView()
        gifImage.clipsToBounds = true
        gifImage.contentMode = .scaleAspectFill
        
        gifImage.isSkeletonable = true
        gifImage.showAnimatedGradientSkeleton()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            gifImage.hideSkeleton()
        })
        return gifImage
    }()
    
    private let gifTitle: UILabel = {
        let gifTitle = UILabel()
        gifTitle.showAnimatedGradientSkeleton()
        gifTitle.numberOfLines = 0
        gifTitle.adjustsFontSizeToFitWidth = false
        
        gifTitle.isSkeletonable = true
        gifTitle.showAnimatedGradientSkeleton()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            gifTitle.hideSkeleton()
        })
        return gifTitle
    }()
    
    func configureGifImage() {
        gifImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.width.height.equalTo(100)
            make.leading.equalToSuperview().inset(20)
        }
    }
    
    func configureGifTitle() {
        gifTitle.numberOfLines = 1
        gifTitle.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(50)
            make.leading.equalTo(gifImage.snp.trailing).offset(15)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    public func setup(with giphy: Giphy) {
        gifTitle.text = giphy.title
        let urlString = giphy.images?.original.url ?? ""
        guard let url = URL(string: urlString) else {
            return
        }
        gifImage.kf.setImage(with: url)
    }
    
}