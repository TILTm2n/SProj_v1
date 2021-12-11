//
//  FinalViewController.swift
//  SProj_v1
//
//  Created by Eugene on 08.12.2021.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBAction func backToSecond(_ sender: Any) {
//        self.dismiss(animated: true) {
//            print("окно закрыто")
//        }
    }
    
    
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodbutton: UIButton!
    @IBOutlet weak var brilliantButton: UIButton!
    var restRating: String?
    
    @IBAction func rateRestaurant(_ sender: UIButton){
        switch sender.tag {
        case 0: restRating = "bad"
        case 1: restRating = "good"
        case 2: restRating = "brilliant"
        default: break
        }
        
        performSegue(withIdentifier: "unwindSegueToDVC", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ratingStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let blurEffect = UIBlurEffect(style: .light)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.insertSubview(blurEffectView, at: 1)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4) {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
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
