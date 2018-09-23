//
//  PostViewCell.swift
//  Instagram
//
//  Created by Shrijan Aryal on 9/22/18.
//  Copyright © 2018 Shrijan Aryal. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostViewCell: UITableViewCell {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var photoView: PFImageView!
    
    @IBOutlet weak var usernameLbl2: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    
    var instagramPost: Post!{
        didSet {
            self.photoView.file = instagramPost.media
            self.photoView.loadInBackground()
            
            self.captionLbl.text = instagramPost.caption
            self.timeStampLbl.text = instagramPost.createdAt?.description
            self.usernameLbl.text = instagramPost.author.username
            self.usernameLbl2.text = instagramPost.author.username
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
