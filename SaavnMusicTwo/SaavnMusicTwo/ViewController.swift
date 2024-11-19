

import UIKit

class TrendingViewController: UIViewController {

    private var trendingItems: [TrendingItem] = [] // Data from the API

    

    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 16, height: 200)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTrendingData()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Trending Now"

    
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: TrendingCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white

    
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

    
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func fetchTrendingData() {
        APIManager.fetchTrending { [weak self] items in
            DispatchQueue.main.async {
                self?.trendingItems = items
                self?.collectionView.reloadData()
            }
        }
    }
}

extension TrendingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.identifier, for: indexPath) as? TrendingCell else {
            return UICollectionViewCell()
        }
        let item = trendingItems[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension TrendingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item: \(trendingItems[indexPath.row].title)")
    }
}
