//
//  FinalViewController.swift
//  SProj_v1
//
//  Created by Eugene on 05.12.2021.
//

import UIKit

class FinalViewController: UIViewController {
    //test
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func closeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        print("sosi")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: true)
        
        closeButton.layer.zPosition = 1
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.view.insertSubview(blurEffectView, at: 1)
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
