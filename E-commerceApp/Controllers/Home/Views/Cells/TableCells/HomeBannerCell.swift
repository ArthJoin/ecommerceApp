//
//  HomeBannerCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 19.10.2023.
//

import UIKit
import SnapKit

class HomeBannerCell: UITableViewCell {
    //MARK: - Public
    func configure(with model: HomeBannerCellModel) {
        self.items = model
        collectionView.reloadData()
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAppearance()
        setupViews()
        constaintViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Constants
    private enum UIConstants {
        static let collectionViewHeight: CGFloat = 163
        static let cellHeight: CGFloat = 144
        static let cellWidth: CGFloat = 304
    }
    
    //MARK: - Private Properties
    private var collectionView: UICollectionView!
    private var items: HomeBannerCellModel = []
}

//MARK: - Private Properties
private extension HomeBannerCell {
    func setupViews() {
        contentView.addSubview(collectionView)
    }
    func constaintViews() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
    func configureAppearance() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerItemCell.self, forCellWithReuseIdentifier: String(describing: BannerItemCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}

//MARK: - UICollectionViewDataSource
extension HomeBannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BannerItemCell.self), for: indexPath) as! BannerItemCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeBannerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
