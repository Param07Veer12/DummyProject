//
//  ViewController.swift
//  InterView
//
//  Created by Paramveer Singh on 16/05/22.
//

import UIKit

class ViewController: UIViewController ,saveData{
    func dataReload(modelMAin: MainModel, index: Int) {
        arrayModel[index] = modelMAin
        self.tblView.reloadData()

    }
    
    var array = [NSDictionary].init()

    let dict = ["id" : "1",
        "employee_name" : "Tiger cscv",
        "employee_salary" : "3593" ,
        "employee_age" : "34",
        "profile_image" : "placeholder"] as! NSDictionary

    var arrayModel = [MainModel].init()
    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
 func getData()
    {
        array.append(dict)
        array.append(dict)
        array.append(dict)
        for item in array
        {
            arrayModel.append(MainModel(id: item["id"] as? String , name: item["employee_name"] as? String, image: item["profile_image"] as? String, salary: item["employee_salary"] as? String, age:  item["employee_age"] as? String))

        }
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ProfileCell"
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ProfileCell
        let modelMain = arrayModel[indexPath.row]
        cell.lblAge.text = "Age:-" + (modelMain.age ?? "")
        cell.lblId.text =  "ID:-" + (modelMain.id ?? "")
        cell.lblName.text = "Employee name-" + (modelMain.name ?? "")
        cell.lblName.frame.size = CGSize(width: cell.lblName.frame.size.width, height: cell.lblName.intrinsicContentSize.height)
        cell.lblSalary.text = "Salary:-" +  (modelMain.salary ?? "")
        cell.imgMain.image = UIImage(named: modelMain.image ?? "")
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileDetailVC") as! ProfileDetailVC
        vc.dataProtocol = self
        vc.index = indexPath.row
        vc.modelMain = arrayModel[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
