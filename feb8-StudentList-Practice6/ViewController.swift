//
//  ViewController.swift
//  feb8-StudentList-Practice6
//
//  Created by TS2 on 2/8/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //search bar step 1
    @IBOutlet weak var searchBarView: UISearchBar!
  
    
    @IBOutlet weak var firstTV: UITableView!
    
    struct Student{
        let studentName: String
        let studentAge: Int
        var studentImage: String
    }
    
    //keep data that update ex user typw dido- only diddo in studentdata variable
   var studentData:[Student] = [
        Student(studentName: "dido", studentAge: 25, studentImage: "s1"),
        Student(studentName: "kitty", studentAge: 24, studentImage: "s2"),
        Student(studentName: "mummy", studentAge: 20, studentImage:"s3"),
        Student(studentName: "kara", studentAge: 22, studentImage:"s4"),
        Student(studentName: "paepae", studentAge: 25, studentImage: "s5"),
   
        ]
    //step2 keep a copy of data of all students
    var originalData:[Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstTV.delegate = self
        firstTV.dataSource = self
        
        //search bar step3
        searchBarView.backgroundImage = UIImage()//make search bar background empty
        
        self.searchBarView.delegate = self
        
        originalData = studentData
        
        //remove 2 gggline bet search bar
        searchBarView.searchBarStyle = .minimal
    }
}
extension ViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            
            let student = studentData[indexPath.row]
            
            vc.holdStudentName = student.studentName + " " + "\(student.studentAge)"
            
            vc.holdStudentImage =
            UIImage(named:student.studentImage)
            
            self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ViewController{
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let vc = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
      let student = studentData[indexPath.row]
        vc.holdStudentName = student.studentName + "" + "\(student.studentAge)"
        vc.holdStudentImage = UIImage(named: student.studentImage)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 80
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CustomTableViewCell
        let student = studentData[indexPath.row]
        cell.studentImageView.image = UIImage(named: student.studentImage)
        cell.studentNameLabel.text = student.studentName + " " + "\(student.studentAge)"
        //"\(student.studentAge)" change age from int to string
        return cell
    }
}
//step 4 searchbar code
extension ViewController{
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
     return true
    }
    //when user type something on the search bar it give us call back
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search by name \(searchText)")
        //\() put variable or value combine with string
        //if user did not typw anything box is empty - show all list
        if searchText.isEmpty{
            studentData = originalData
            self.firstTV.reloadData()
            return
        }else{
//            studentData = studentData.filter{
//                $0.studentName.lowercased().contains(searchText.lowercased())
//                self.firstTV.reloadData()
//           
//            }
            studentData = studentData.filter { $0.studentName.lowercased().contains(searchText.lowercased()) }
            self.firstTV.reloadData()
        }
    }
}


