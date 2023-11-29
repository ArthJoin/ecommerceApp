//
//  HomeCategoryCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 20.10.2023.
//

import UIKit

class HomeCategoryCell: UITableViewCell {
    //MARK: - Public
    func configure(with model: ProductCategoryCellModel){
        self.item = model
        collectionView.reloadData()
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constants
    private enum UIConstants {
        static let cellWidth = 57
        static let cellHeight = 61
        static let collectionViewWidth = 349
        static let headerTitleFontSize: CGFloat = 14
        static let headerHeight: CGFloat = 17
        static let headerTitleOffsetLT: CGFloat = 21
        static let collectionToHeaderOffset: CGFloat = 13
    }
    
    //MARK: - Private Properties
    private var collectionView: UICollectionView!
    private var item: ProductCategoryCellModel = []
    
    private let header: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let headerTitle: UILabel = {
        let title = UILabel()
        title.text = "Category"
        title.font = Resources.Fonts.systemWeight(with: UIConstants.headerTitleFontSize, weight: .medium)
        return title
    }()
}

//MARK: - Private method
private extension HomeCategoryCell {
    func initialize() {
        selectionStyle = .none
        contentView.addSubview(header)
        header.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(UIConstants.headerHeight)
        }
        header.addSubview(headerTitle)
        headerTitle.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().offset(UIConstants.headerTitleOffsetLT)
        }

        //MARK: - CollectionView Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //MARK: - Register
        collectionView.register(CategoryItemCell.self, forCellWithReuseIdentifier: String(describing: CategoryItemCell.self))
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        
        //MARK: - CollectionView Constraints
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(UIConstants.collectionToHeaderOffset)
            make.height.equalTo(UIConstants.cellHeight)
            make.width.equalTo(UIConstants.collectionViewWidth)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: - UICollectionViewDataSource
extension HomeCategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryItemCell.self), for: indexPath) as! CategoryItemCell
        cell.configure(with: item[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeCategoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}
