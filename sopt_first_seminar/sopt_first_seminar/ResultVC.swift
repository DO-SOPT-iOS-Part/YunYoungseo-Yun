//
//  ResultVC.swift
//  sopt_first_seminar
//
//  Created by 윤영서 on 10/7/23.
//

import UIKit

class ResultVC: UIViewController {
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var nickname: String=""
    var email: String = ""
    var password: String = ""
    
    var delegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!
    
    private func bindText() {
        self.nicknameLabel.text = "환영합니다! \(nickname)님"
        self.emailLabel.text = "Email : \(email)"
        self.passwordLabel.text = "Password : \(password)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        delegate?.getLoginData(nickname: self.nickname, email: self.email,
                               password: self.password)
        guard let loginDataCompletion else {return}
        loginDataCompletion([self.email, self.password])
        
    }
    
    func setLabelText(nickname: String, id: String, password: String) {
        self.nickname = nickname
        email = id
        self.password = password
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
