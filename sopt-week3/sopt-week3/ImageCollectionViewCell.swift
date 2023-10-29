//
//  ImageCollectionViewCell.swift
//  sopt-week3
//
//  Created by 윤영서 on 10/28/23.
//

import UIKit

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
} // 어디에 선언해줘도 상관없음 - 이 파일에서만 해당 프로토콜이 생기면 이런식으로

class ImageCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ItemSelectedProtocol?
    
    static let identifier: String = "ImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [imageView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    var itemRow: Int?
    
    func bindData(data: ImageCollectionData,
                  row: Int) {
        self.imageView.image = UIImage(named: data.image)
        self.likeButton.isSelected = data.isLiked
        self.itemRow = row
    }
    
    private let imageView = UIImageView()
    
    private lazy var likeButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(likeButtonTap),
                     for: .touchUpInside)
        $0.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        $0.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
    }
    
    @objc private func likeButtonTap() {
        self.likeButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.getButtonState(state: self.likeButton.isSelected,
                                          row: itemRow)
        }
    }
    
    
}
