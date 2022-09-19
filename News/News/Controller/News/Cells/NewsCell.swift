//
//  NewsCell.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(article: Article) {
        imgView.kf.setImage(with: URL(string: article.urlToImage ?? ""))
        lblTitle.text = article.title
        lblContent.text = article.description
        if let date = article.publishedAt?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ") {
            let update = date.stringDate(format: "MMM yyyy, HH:mm")
            lblDate.text = "Updated: \(update)"
        }
        
    }
}
