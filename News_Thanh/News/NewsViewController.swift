//
//  NewsViewController.swift
//  News_Thanh
//
//  Created by Thân Văn Thanh on 4/22/21.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON

class NewsViewController: UIViewController {
    
    var data = [Articles]()

    let backgroudView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let topLabel : UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "News"
        lable.textColor = .red
        lable.tintColor = .black
        lable.sizeToFit()
        lable.font = UIFont(name: "Chalkduster", size: 40)
        
        return lable
        
    }()
    
    let tableView : UITableView = {
        let view = UITableView ()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.separatorStyle = .none // an cac thanh duoi cac cell
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        getAPI("https://newsapi.org/v2/top-headlines?sources=bbc-news,cbc-news,nbc-news,fox-news,mtv-news=&page=1&pageSize=10&apiKey=bb9bf177194b4942b041631cca42adee")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewSTableViewCell.self, forCellReuseIdentifier: "NewSTableViewCell")
        setupLayout()
    }
    func setupLayout(){
        view.addSubview(backgroudView)
        backgroudView.addSubview(topLabel)
        backgroudView.addSubview(tableView)
        
        backgroudView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        backgroudView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroudView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroudView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: backgroudView.topAnchor, constant: 20).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor, constant: 20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backgroudView.bottomAnchor, constant: 0).isActive = true
    }
    
    func getAPI(_ url: String){
        let urlRequest = URL(string: url)!
        
        AF.request(urlRequest, method: .get, encoding: URLEncoding.default).responseJSON { (reponse) in
            switch (reponse.result){
            case .success(let value):
                print(value)
                let json = JSON(value)
                let news = News(json)
                if let articles = news?.articless{
                    print(articles.count)
                    self.data = articles
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
extension NewsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewSTableViewCell", for: indexPath) as! NewSTableViewCell
        cell.dataS = data[indexPath.row]
        
        return cell
    
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.row].title!)
        guard let url = URL(string: data[indexPath.row].url ?? "") else { return }
        
        let vc = NewsDetailViewController(url: url)
        navigationController?.pushViewController(vc, animated: true)
    }
}
