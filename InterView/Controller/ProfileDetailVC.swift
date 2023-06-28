//
//  ProfileDetailVC.swift
//  InterView
//
//  Created by Paramveer Singh on 16/05/22.
//

import UIKit

class ProfileDetailVC: UIViewController {
    var index : Int?
    var modelMain = MainModel.init()
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var tfName: UITextField!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var tfSalary: UITextField!
    @IBOutlet var tfId: UITextField!
    @IBOutlet var viewImgBack: UIView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var tfAge: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
       } 
    var dataProtocol : saveData!
    func setUpView()
    {
        viewImgBack.layer.cornerRadius = viewImgBack.frame.height / 2
        viewImgBack.clipsToBounds = false
        viewImgBack.layer.shadowColor = UIColor.black.cgColor
        viewImgBack.layer.shadowOpacity = 1
        viewImgBack.layer.shadowOffset = CGSize.zero
        viewImgBack.layer.shadowRadius = 3

        self.mainLabel.text = (modelMain.name ?? "") + " Details"
        self.tfId.text = modelMain.id
        self.tfSalary.text = modelMain.salary
        self.tfAge.text = modelMain.age
        self.tfName.text = modelMain.name
        self.imgProfile.layer.cornerRadius = self.imgProfile.frame.height / 2
        btnSave.layer.cornerRadius = 4
        tfName.layer.cornerRadius = 4
        tfName.layer.borderColor = UIColor.black.cgColor
        tfName.layer.borderWidth = 1
        tfName.setLeftPadding()
        tfSalary.layer.cornerRadius = 4
        tfSalary.layer.borderColor = UIColor.black.cgColor
        tfSalary.layer.borderWidth = 1
        tfSalary.setLeftPadding()
        tfId.layer.cornerRadius = 4
        tfId.layer.borderColor = UIColor.black.cgColor
        tfId.layer.borderWidth = 1
        tfId.setLeftPadding()
        tfAge.layer.cornerRadius = 4
        tfAge.layer.borderColor = UIColor.black.cgColor
        tfAge.layer.borderWidth = 1
        tfAge.setLeftPadding()
    }

    @IBAction func btnSave(_ sender: UIButton) {
        dataProtocol.dataReload(modelMAin: MainModel(id: modelMain.id, name: tfName.text!, image: modelMain.image, salary: tfSalary.text!, age: tfAge.text!), index: index ?? 0)
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func btnBAckAct(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

protocol saveData
{
    func dataReload(modelMAin : MainModel,index : Int)
}

extension UITextField {

    func setLeftPadding(_ amount: CGFloat = 10) {

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.bounds.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    func setRightPadding(_ amount: CGFloat = 10) {

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.bounds.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
