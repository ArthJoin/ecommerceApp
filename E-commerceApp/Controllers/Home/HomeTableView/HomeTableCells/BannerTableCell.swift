import UIKit

class BannerTableCell: UITableViewCell {

    private var bannerCollection: UICollectionView!
    
    private let array = [
        Resources.Images.test.banner.banner1,
        Resources.Images.test.banner.banner2
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
        setupViews()
        constaintViews()
    }

}

extension BannerTableCell {
    func setupViews() {
        
    }

    func constaintViews() {

    }

    func configureAppearance() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        bannerCollection = UICollectionView(frame: contentView.bounds, collectionViewLayout: layout)
        bannerCollection.dataSource = self
        let nib = UINib(nibName: "BannerCell", bundle: .main)
        bannerCollection.register(nib, forCellWithReuseIdentifier: "BannerCell")
        
        contentView.addSubview(bannerCollection)
    }
}

extension BannerTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        let image = array[indexPath.row]
        cell.configure(image!)
        return cell
    }
}
