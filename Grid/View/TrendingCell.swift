//
//  TrendingCell.swift
//  Grid
//
//  Created by Aarnav Singh on 20/11/24.
//

import UIKit
import Foundation
import SDWebImage

/// Responsible for displaying Trending Item
class TrendingCell: UICollectionViewCell {
    /// cell indetifier
    static let identifier = "TrendingCell"

    /// Trending Image view
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    /// Trending Title
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        /// add into view
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        /// layout setup
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    /// setup cell based on TredningItem Model
    func configure(with item: TrendingItem) {
        titleLabel.text = item.title
        
        // Use SDWebImage to load the image
        if let imageURL = URL(string: item.image) {
            imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(systemName: "saavn")) { image, error, cacheType, url in
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                } else {
                    print("Image loaded successfully from \(cacheType)")
                }
            }
        }
        
        /*
        /// through URLSession
        if let url = URL(string: item.image) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data, error == nil {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
            }.resume()
        }
         */
    }
}
