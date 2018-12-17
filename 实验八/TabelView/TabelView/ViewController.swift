//
//  ViewController.swift
//  TabelView
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 yangmiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chooseLabel: UILabel!
    
    @IBOutlet weak var nameTextFied: UITextField!
    @IBOutlet weak var ageTextFied: UITextField!
    @IBOutlet weak var genderTextFied: UITextField!
    @IBOutlet weak var gradeTextFied: UITextField!
    @IBOutlet weak var stuTabelView: UITableView!
    var stuArray = [Student]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: StudentTableViewCell!
        
        cell = (tableView.dequeueReusableCell(withIdentifier: "stuCell") as! StudentTableViewCell)
        
        let stu = stuArray[indexPath.row]
        
        cell.name.text = "name：\(stu.name)"
        cell.age.text = "age：\(stu.age)"
        cell.gender.text = "gender：\(stu.gender)"
        cell.grade.text = "grade：\(stu.grade)"
        if indexPath.row % 2 == 0 {
            cell.pic.image = UIImage(named: "image")
        }else {
            cell.pic.image = UIImage(named: "image2")
        }
        cell.name.sizeToFit()
        cell.age.sizeToFit()
        cell.gender.sizeToFit()
        cell.grade.sizeToFit()
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuArray.append(Student(name: "yangmiao", age: "18", gender: "nv", grade: "3"))
        stuArray.append(Student(name: "zhangwei", age: "18", gender: "nv", grade: "1"))
        stuArray.append(Student(name: "zhanwenyu", age: "18", gender: "nv", grade: "4"))
        stuArray.append(Student(name: "zhangcaixia", age: "16", gender: "nan", grade: "2"))
        stuArray.append(Student(name: "zhangsufen", age: "19", gender: "nv", grade: "3"))
        stuArray.append(Student(name: "yangchunmiao", age: "21", gender: "nv", grade: "1"))
        stuArray.append(Student(name: "wujiancheng", age: "31", gender: "nan", grade: "2"))
        stuArray.append(Student(name: "wuchangyuan", age: "24", gender: "nan", grade: "4"))
        stuArray.append(Student(name: "wnagyiyun", age: "12", gender: "nan", grade: "3"))
    }

    @IBAction func addClicked(_ sender: Any) {
        if let name = nameTextFied.text, let age = ageTextFied.text, let gender = genderTextFied.text, let grade = gradeTextFied.text{
            stuArray.append(Student(name: name, age: age, gender: gender, grade: grade))
            stuTabelView.reloadData()
        }
        nameTextFied.resignFirstResponder()
        ageTextFied.resignFirstResponder()
        genderTextFied.resignFirstResponder()
        gradeTextFied.resignFirstResponder()
    }
    
    
    @IBAction func editClicked(_ sender: Any) {
        if let row = stuTabelView.indexPathForSelectedRow?.row {
            if let name = nameTextFied.text, let age = ageTextFied.text, let gender = genderTextFied.text, let grade = gradeTextFied.text{
                stuArray[row] = Student(name: name, age: age, gender: gender, grade: grade)
                stuTabelView.reloadData()
            }
        }
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        stuTabelView.isEditing = !stuTabelView.isEditing
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "you choose is \(stuArray[indexPath.row].name)"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stuArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

