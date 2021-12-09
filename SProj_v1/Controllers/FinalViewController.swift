//
//  FinalViewController.swift
//  SProj_v1
//
//  Created by Eugene on 08.12.2021.
//

import UIKit

class FinalViewController: UIViewController {

    @IBAction func backToSecond(_ sender: Any) {
        self.dismiss(animated: true) {
            print("окно закрыто")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
