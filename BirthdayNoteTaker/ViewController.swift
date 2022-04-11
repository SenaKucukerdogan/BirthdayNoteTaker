//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Sena Küçükerdoğan on 26.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldBirthday: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLAbel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "name")  //viewDidLoad program ilk çalıştığında çalışır. Değeri açılır açılmaz almak için name ve birhday değerlerini burada çağırdık
        
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting -> as? vs. as!
        //nameLabel.text = storedName as? String ya da daha mantıklısı if let ile yapmaktır
        
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String{
            birthdayLAbel.text = "Birthday: \(newBirthday)"
        }
        
    }

    @IBAction func buttonSave(_ sender: Any) {
        
        UserDefaults.standard.set(textFieldName.text!, forKey: "name")
        UserDefaults.standard.set(textFieldBirthday.text!, forKey: "birthday")
        
        
        nameLabel.text = "Name: \(textFieldName.text!)"
        birthdayLAbel.text = "Birthday: \(textFieldBirthday.text!)"
        
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLAbel.text = "Birthday: "
        }
        
        
    }
    
}

