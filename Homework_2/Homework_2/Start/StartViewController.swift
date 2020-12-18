//
//  StartViewController.swift
//  Homework_2
//
//  Created by FARIT GATIATULLIN on 18.12.2020.
//

import UIKit


class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSignInButton(_ sender: Any) {
      print("Sign in button tapped")
    }

    @IBAction func didTapSignUpButton(_ sender: Any) {
      print("Sign up button tapped")
    }
    
    @IBOutlet weak var signInButton: UIButton! {
        didSet{
            //signInButton.backgroundColor = .clear
//            signInButton.layer.cornerRadius = 10
//            signInButton.layer.borderWidth = 2
//            signInButton.layer.borderColor = UIColor.blue.cgColor
            signInButton.layer.shadowColor = UIColor.gray.cgColor
            signInButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            signInButton.layer.masksToBounds = false
            signInButton.layer.shadowOpacity = 1.0;
            
        }
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
