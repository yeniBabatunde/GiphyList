import Foundation

extension MainViewCell {
    func configureViewCell() {
        configureGifImage()
        configureGifTitle()
    }
    func configureGifImage() {
       
        gifImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leading.equalToSuperview().inset(30)
        }
    }
    
    func configureGifTitle() {
                gifTitle.snp.makeConstraints { (make) in
                    make.centerY.equalTo(self.contentView)
                    make.height.equalTo(50)
                    make.leading.equalTo(gifImage.snp.trailing).offset(15)
                }
    }
}