//
//  HomeProductListCell.swift
//  E-commerceApp
//
//  Created by Артур Наврузов on 21.10.2023.
//

import UIKit

protocol HomeProductListCellDelegate: AnyObject {
    func didSelectItem(with id: Int)
}

class HomeProductListCell: UITableViewCell {
    weak var delegate: HomeProductListCellDelegate?
    
    //MARK: - Public
    func configure() {
        let product = MocNetworkManager.shared.getProductList()
        self.item = product
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
    
    //MARK: - Private Constants
    private enum UIConstants {
        static let collectionWidth: CGFloat = 349
        static let collectionHeight: CGFloat = 892
        static let cellWidth: CGFloat = 170
        static let cellHeight: CGFloat = 217
        static let minimumInteritemSpacing: CGFloat = 9
        static let headerTitleFontSize: CGFloat = 14
        static let headerTitleOffsetLT: CGFloat = 21
        static let headerTitleOffsetTB: CGFloat = 5
        static let headerHeight: CGFloat = 27
        static let collectionToHeaderOffset: CGFloat = 21
    }
    
    //MARK: - Private Properties
    private var collectionView: UICollectionView!
    private var item: HomeProductListCellModel = []
    
    private let header: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let headerTitle: UILabel = {
        let title = UILabel()
        title.text = "Recent product"
        title.font = Resources.Fonts.systemWeight(with: UIConstants.headerTitleFontSize, weight: .medium)
        return title
    }()
}

//MARK: - Private method
extension HomeProductListCell {
    func initialize() {
        selectionStyle = .none
        contentView.addSubview(header)
        header.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(UIConstants.headerHeight)
        }
        header.addSubview(headerTitle)
        headerTitle.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(UIConstants.headerTitleOffsetTB)
            make.leading.trailing.equalToSuperview().offset(UIConstants.headerTitleOffsetLT)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = UIConstants.minimumInteritemSpacing
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        
        collectionView.register(ProductItemCell.self, forCellWithReuseIdentifier: String(describing: ProductItemCell.self))
        collectionView.dataSource = self
        
        //MARK: - CollectionView Constraints
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(UIConstants.collectionToHeaderOffset)
            make.width.equalTo(UIConstants.collectionWidth)
            make.height.equalTo(UIConstants.collectionHeight)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalToSuperview()
        }
    }
}

//MARK: -
extension HomeProductListCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductItemCell.self), for: indexPath) as! ProductItemCell
        cell.configure(with: item[indexPath.row])
        cell.buttonAction = { [weak self] id in
            self?.delegate?.didSelectItem(with: id)
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeProductListCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}



