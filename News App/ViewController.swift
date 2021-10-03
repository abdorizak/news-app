//
//  ViewController.swift
//  News App
//
//  Created by Abdirizak Hassan on 9/17/21.
//

import UIKit
import Alamofire
import Kingfisher


class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var articles = [Article]()
    /*
     https://newsapi.org/v2/top-headlines
     sources= bbc-news
     apiKey= 3f67f8a4b26740e3aa2f06d3364945c1
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        getArticles()
    }
    
    func getArticles(){
        let prameter: Parameters = ["country": "us",
                                    "apiKey": "3f67f8a4b26740e3aa2f06d3364945c1"]
        AF.request("https://newsapi.org/v2/top-headlines", parameters: prameter).response { response in
            guard let data = response.data else { return }
            
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                let response = try JSONDecoder().decode(TopHeadlinesResponse.self, from: data)
//                print(response)
                self.articles = response.articles
                self.collectionView.reloadData()
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
                
            } catch {
                print(error)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
        let articleInfo = articles[indexPath.item]
        cell.populate(with: articleInfo)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.item]
        performSegue(withIdentifier: "segue.Main.newsToarticle", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let articleVc = segue.destination as? ArticleVc, let article = sender as? Article {
            articleVc.article = article
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
}


