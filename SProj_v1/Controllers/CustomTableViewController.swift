//
//  CustomTableViewController.swift
//  SProj_v1
//
//  Created by Eugene on 21.11.2021.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    //Модель - массивы данных
    var restaurantNames = ["Ogonёk Grill&Bar","Елу","Bonsai","Дастархан","Индокитай","X.O","Баклан Гриль","Respublica","Respublica","Respublica","Respublica","Respublica","Respublica","Respublica"]
    var restaurantImages = ["ogonek.jpg","elu.jpg","bonsai.jpg","dastarhan.jpg","indokitay.jpg","x.o.jpg","balkan.jpg","respublica.jpg","speakeasy.jpg","morris.jpg","istorii.jpg","klassik.jpg","love.jpg","shok.jpg","bochka.jpg",]
    var restaurantIsVisited = [Bool](repeatElement(false, count: 15))
    
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell

        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true

        return cell
    }
    
    func showAlert(_ index: Int, _ tableView: UITableView, _ indexPath: IndexPath){
        let ac = UIAlertController(title: "Заголовок", message: "Выберите действие", preferredStyle: .actionSheet)
        
//first action
        let call = UIAlertAction(title: "Позвонить: +7 910 601 50 9\(index)", style: .default){
            (action: UIAlertAction) -> Void  in
            
            let alertC = UIAlertController(title: "nil", message: "Вызов не может быть совершен", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "nil", style: .default, handler: nil)
            alertC.addAction(ok)
            self.present(alertC, animated: true, completion: nil)
        }
                
//second action
        let isVisitedTitle = self.restaurantIsVisited[index] ? "I wasn't here" : "I was here"
        
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { (action) in
            let cell = tableView.cellForRow(at: indexPath)
            
            self.restaurantIsVisited[index] = !self.restaurantIsVisited[index]
            cell?.accessoryType = self.restaurantIsVisited[index] ? .checkmark : .none
            
            
        }
        
//third action
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        
        ac.addAction(cancel)
        ac.addAction(call)
        ac.addAction(isVisited)
        present(ac, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(indexPath.row, tableView, indexPath)
    }
    
    

//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            self.restaurantImages.remove(at: indexPath.row)
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restaurantIsVisited.remove(at: indexPath.row)
//        }
//
//        //tableView.reloadData()
//    tableView.deleteRows(at: [indexPath], with: .fade)
//    }
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) ->
//    [UITableViewRowAction]? {
//
//    }
    
    
}
