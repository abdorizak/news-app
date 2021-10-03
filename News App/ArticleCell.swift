//
//  ArticleCell.swift
//  News App
//
//  Created by Abdirizak Hassan on 9/17/21.
//

import UIKit


class ArticleCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text?.removeAll()
        imageView.image = nil
    }
    
    func populate(with article: Article) {
        titleLabel.text = article.headline
        if let urlImage = article.urlToImage {
            let url = URL(string: urlImage )
            imageView.kf.setImage(with: url)
        }
    }
    
}
