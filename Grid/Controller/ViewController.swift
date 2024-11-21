//
//  ViewController.swift
//  Grid
//
//  Created by Aarnav Singh on 20/11/24.
//

import UIKit

class ViewController: UIViewController {
    /// Model
    private var trendingItems: [TrendingItem] = []
    
    /// Collection view for displaying trending item in scrollable view
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 16, height: 200)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        fetchTrendingData()
    }
    
    private func setupUI() {
        /// setting up background color
        self.view.backgroundColor = .white
        /// setting up title
        self.title = "Trending Now"

        /// setting up collection view
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
        NetworkManager.fetchTrendingByAF { result in
            switch result {
            case .success(let items):
                print("Successfully fetched \(items.count) trending items:")
                self.trendingItems = items
                self.collectionView.reloadData()
            case .failure(let error):
                print("Failed to fetch trending items: \(error.localizedDescription)")
                // Show the error alert
                self.showAlert(title: "Something went wrong", message: "Please try again!")
            }
        }
        /*
        NetworkManager.fetchTrending { result in
            switch result {
            case .success(let items):
                print("Successfully fetched \(items.count) trending items:")
                self.trendingItems = items
                self.collectionView.reloadData()
            case .failure(let error):
                print("Failed to fetch trending items: \(error.localizedDescription)")
            }
        }
         */
    }
    
    func showAlert(title: String, message: String) {
        // Create an alert controller
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add an "OK" action
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        // Present the alert
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
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

//MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected item: \(trendingItems[indexPath.row].title)")
    }
}

