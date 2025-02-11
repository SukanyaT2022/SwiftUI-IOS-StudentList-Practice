//
//  SecondVC.swift
//  feb8-StudentList-Practice6
//
//  Created by TS2 on 2/9/25.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var secondScreenImage: UIImageView!
    
    @IBOutlet weak var secondScreenLabel: UILabel!
    
    var holdStudentName: String!
    var holdStudentImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.secondScreenImage.image = holdStudentImage
        self.secondScreenLabel.text = holdStudentName
        self.secondScreenLabel.textAlignment = .center
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
