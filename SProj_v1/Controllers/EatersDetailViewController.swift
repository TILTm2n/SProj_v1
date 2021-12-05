//
//  EatersDetailViewController.swift
//  SProj_v1
//
//  Created by Eugene on 27.11.2021.
//

import UIKit

class EatersDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rateButton: UIButton!
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func rateButtonSegue(_ sender: Any) {
        let fvc = storyboard?.instantiateViewController(withIdentifier: "FinalVC") as! FinalViewController
        navigationController?.pushViewController(fvc, animated: true)
        
        print("po")
    }
    
    var restaurant: Restaurant?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second Controller"
        imageView.image = UIImage(named: restaurant!.image)
        
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableView.automaticDimension
        
        rateButton.layer.cornerRadius = 5
        rateButton.layer.borderWidth = 2
        rateButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
        
        switch indexPath.row{
        case 0:
            cell.keyLabel.text = "nazvanie"
            cell.valueLabel.text = restaurant?.name
        case 1:
            cell.keyLabel.text = "type"
            cell.valueLabel.text = restaurant?.type
        case 2:
            cell.keyLabel.text = "adress"
            cell.valueLabel.text = restaurant?.location
        case 3:
            cell.keyLabel.text = "i was here"
            cell.valueLabel.text = restaurant!.isVisited ? "yes" : "no"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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


