//
//  ReviewTableViewCell.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/27/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import UIKit
import Cosmos

class ReviewTableViewCell: UITableViewCell,ReusableCellView {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var ratingStarView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCellWith(review:ReviewItem) {
        self.ratingStarView.rating = Double(review.rating ?? "0") ?? 0.0
        messageLabel.text = review.message ?? ""
        dateLabel.text = review.date ?? ""
        authorLabel.text = review.author ?? ""
        titleLable.text = review.title ?? ""
    }
}
