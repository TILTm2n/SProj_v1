//
//  ViewController.swift
//  SProj_v1
//
//  Created by Eugene on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {

    let names = ["Курица","Свинина","Говядина","Окунь","Осетр","Камбала","Ставридка","Стерлядь","Устрицы","Оленина","Заяц","Индейка",]
    
    //override var prefersStatusBarHidden: Bool{
    //    return true
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = names[indexPath.row]
        cell?.imageView?.image = UIImage(named: "avatar")
        cell?.backgroundColor = UIColor(named: "Red")
        cell?.layer.cornerRadius = 10
        
        
        return cell!
    }
    
    
}

