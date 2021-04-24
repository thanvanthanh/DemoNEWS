//
//  NewSTableViewCell.swift
//  News_Thanh
//
//  Created by Thân Văn Thanh on 4/22/21.
//


import UIKit
import Kingfisher

class NewSTableViewCell: UITableViewCell {
    var dataS : Articles?{
        didSet{
            if let data = dataS {
                if data.image != "" {
                    let url = URL(string: data.image ?? "")
                    imageNew.kf.setImage(with: url)
                } else {
                    imageNew.image = UIImage(named: "default")
                }
                sourceLabel.text = data.author
                sourceLabel.textColor = setTextColorSourceView(data.author ?? "")
                titleLabel.text = data.title ?? ""
                timeLabel.text = formatDateString(data.publishedAt ?? "")
//                (dataS.publishedAt!.prefix(10)) // prefix 10 la cat lay 10 ki tu

                
            }
        }
    }
    
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let imageNew : UIImageView = {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.image = UIImage(named: "default")
        imageV.layer.cornerRadius = 5
        imageV.clipsToBounds = true
        
        return imageV
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Tucker reacts to politicization of Derek Chauvin trial"
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.numberOfLines = 3
        return title
    }()
    
    let timeLabel : UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.text = "021-04-21T01:37:24.5970052Z"
        time.textColor = .lightGray
        time.sizeToFit()
        return time
        
    }()
    let sourceLabel : UILabel = {
        let source = UILabel()
        source.translatesAutoresizingMaskIntoConstraints = false
        source.text = "CBC"
        source.textColor = .blue
        source.sizeToFit()
//        source.font = UIFont.boldSystemFont(ofSize: 15)
        return source
        
    }()
    
    
    let dashBottom : UIView = {
    let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .none
        setupLayout()
        

    }
    func setupLayout(){
        self.addSubview(containerView)
        containerView.addSubview(imageNew)
        containerView.addSubview(sourceLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(dashBottom)
        
        
       
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        sourceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        sourceLabel.trailingAnchor.constraint(equalTo: imageNew.trailingAnchor, constant: 0).isActive = true
        
        imageNew.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        imageNew.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        imageNew.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        imageNew.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.2).isActive = true
        
        imageNew.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        imageNew.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        imageNew.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        imageNew.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: -20).isActive = true

        
        timeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 5).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        
        dashBottom.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        dashBottom.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        dashBottom.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.9).isActive = true
        dashBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true



        

        
    }
    
    func formatDateString (_ publishDate: String) -> String{
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"
            
            let dateFormatterOutPut = DateFormatter()
            dateFormatterOutPut.dateFormat = "HH:mm dd-MM-yyyy"
            
            if let date = dateFormatterGet.date(from: publishDate) {
                return dateFormatterOutPut.string(from: date)
            } else {
                return ""
            }
        }
    func setTextColorSourceView (_ author : String) -> UIColor {
        switch author {
        case "Fox News":
            return UIColor(red: 0.08, green: 0.20, blue: 0.40, alpha: 1.00)
        case "BBC News":
            return UIColor(red: 0.73, green: 0.23, blue: 0.13, alpha: 1.00)
        case "CBC News":
            return UIColor(red: 0.89, green: 0.29, blue: 0.17, alpha: 1.00)
        case "NBC News":
            return UIColor(red: 0.06, green: 0.13, blue: 0.22, alpha: 1.00)
        case "MTV News":
            return UIColor(red: 0.12, green: 0.02, blue: 0.08, alpha: 1.00)
        default:
            return UIColor(red: 0.08, green: 0.20, blue: 0.40, alpha: 1.00)
        }
        
    }
}


