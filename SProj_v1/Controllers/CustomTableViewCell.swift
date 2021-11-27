//
//  CustomTableViewCell.swift
//  SProj_v1
//
//  Created by Eugene on 21.11.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell{
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typelabel: UILabel!
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
    }
}
