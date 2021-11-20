//
//  ViewController.swift
//  SProj_v1
//
//  Created by Eugene on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0;
    
    
    @IBAction func buttonControl(_ sender: Any) {
        counter += 1;
        
        let alert1 = UIAlertController(title: "Четность", message: "Четное - \(counter)", preferredStyle: UIAlertController.Style.alert);
        let alert2 = UIAlertController(title: "Четность", message: "Нечетное  - \(counter)", preferredStyle: UIAlertController.Style.alert);
        
        let alertAction1 = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        let alertAction2 = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        if counter%2 == 0 {
            alert1.addAction(alertAction1)
            present(alert1, animated: true, completion: nil)
        }else{
            alert2.addAction(alertAction2)
            present(alert2, animated: true, completion: nil)

        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

