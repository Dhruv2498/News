//
//  NewsListTableViewCell.swift
//  AppleNews
//
//  Created by Mac on 23/10/23.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var NewsListImageview: UIImageView!
    @IBOutlet weak var lblAuther: UILabel!
    @IBOutlet weak var lblPublishedAt: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var WebViewURL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
