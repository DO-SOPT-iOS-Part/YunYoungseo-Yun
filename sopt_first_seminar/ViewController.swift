//
//  ViewController.swift
//  sopt_first_seminar
//
//  Created by 윤영서 on 10/7/23.
//

import UIKit


class ViewController: UIViewController {
    private var nicknameText: String = ""
    private var idText: String = ""
    private var passwordText: String = ""
    
    @IBOutlet weak var colorChangeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var colorChangeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeTextColor()
        self.colorChangeSwitch.isOn = false
    }
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
    }
    
    @IBAction func passwordTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
    }
    
    @IBAction func nicknameTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let nicknameText = textField.text {
            self.nicknameText = nicknameText
        }
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        print("\(nicknameText)\n\(idText)\n\(passwordText)")
        pushToResultVC()
    }
    
    @IBAction func backgroundColorChangeSwitch(_ sender: UISwitch) {
        changeBackgroundColor()
    }
    
    func changeBackgroundColor() {
        if self.colorChangeSwitch.isOn {
            self.view.backgroundColor = UIColor.lightGray
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    func changeTextColor() {
        guard let text = self.descriptionLabel.text else {return}
        let attributeString = NSMutableAttributedString(string : text)
        attributeString.addAttribute(.foregroundColor, value: UIColor.blue, range: (text as NSString).range(of: "로그인"))
        self.descriptionLabel.attributedText = attributeString
    }
    
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultVC else {return}
        resultVC.setLabelText(nickname: self.nicknameText, id: self.idText,
                              password: self.passwordText)
        resultVC.delegate = self
        self.navigationController?.pushViewController(resultVC, animated: true)
        
        resultVC.loginDataCompletion = { data in
            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
        }
    }
    
    func presentToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC else {return}
        resultVC.nickname = nicknameText
        resultVC.email = idText
        resultVC.password = passwordText
        self.present(resultVC, animated: true)
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(nickname: String, email: String, password: String) {
        print("받아온 nickname : \(nickname), 받아온 email : \(email), 받아온 password : \(password)")
    }
}
