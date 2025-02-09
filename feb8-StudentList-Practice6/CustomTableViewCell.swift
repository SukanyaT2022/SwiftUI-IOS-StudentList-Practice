//
//  CustomTableViewCell.swift
//  feb8-StudentList-Practice6
//
//  Created by TS2 on 2/8/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImageView: UIImageView!
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
//    this function make image circle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.studentImageView.layer.cornerRadius = self.studentImageView.frame.width / 2
        self.studentImageView.layer.masksToBounds = true
    }
}
