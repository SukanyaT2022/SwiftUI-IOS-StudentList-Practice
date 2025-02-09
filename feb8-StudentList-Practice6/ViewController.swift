//
//  ViewController.swift
//  feb8-StudentList-Practice6
//
//  Created by TS2 on 2/8/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var firstTV: UITableView!
    
    struct Student{
        let studentName: String
        let studentAge: Int
        let studentImage: String
    }
    
    
   var data:[Student] = [
        Student(studentName: "dido", studentAge: 25, studentImage: "s1"),
        Student(studentName: "kitty", studentAge: 24, studentImage: "s2"),
        Student(studentName: "mummy", studentAge: 20, studentImage:"s3"),
        Student(studentName: "kara", studentAge: 22, studentImage:"s4"),
        Student(studentName: "paepae", studentAge: 25, studentImage: "s5"),
   
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstTV.delegate = self
        firstTV.dataSource = self
        
    }
}
extension ViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("tap me!")
    }
}
extension ViewController{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CustomTableViewCell
        let student = data[indexPath.row]
        cell.studentImageView.image = UIImage(named: student.studentImage)
        cell.studentNameLabel.text = student.studentName + " " + "\(student.studentAge)"
        //"\(student.studentAge)" change age from int to string
     return cell
    }
}


