//
//  CustomTableViewController.swift
//  SProj_v1
//
//  Created by Eugene on 21.11.2021.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    //Модель - массивы данных
    var restaurants: [Restaurant] = []
//    var restaurants: [Restaurant] = [
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Alushta", image: "ogonek.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "elu.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "bonsai.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "dastarhan.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "indokitay.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "x.o.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "balkan.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "ogonek.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "speakeasy.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "morris.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "istorii.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "klassik.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "love.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "shok.jpg", isVisited: false),
//        Restaurant(name: "Ogonek Grill&Bar", type: "restaurant", location: "Ufa", image: "bochka.jpg", isVisited: false),
//    ]
    
    @IBAction func close(segue: UIStoryboardSegue){
        
    }
    
//    var restaurantNames = ["Ogonёk Grill&Bar","Елу","Bonsai","Дастархан","Индокитай","X.O","Баклан Гриль","Respublica","Respublica","Respublica","Respublica","Respublica","Respublica","Respublica"]
//    var restaurantImages = ["ogonek.jpg","elu.jpg","bonsai.jpg","dastarhan.jpg","indokitay.jpg","x.o.jpg","balkan.jpg","respublica.jpg","speakeasy.jpg","morris.jpg","istorii.jpg","klassik.jpg","love.jpg","shok.jpg","bochka.jpg",]
//    var restaurantIsVisited = [Bool](repeatElement(false, count: 15))
    
    //
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
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
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell

        cell.thumbnailImageView.image = UIImage(data: restaurants[indexPath.row].image! as Data)
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typelabel.text = restaurants[indexPath.row].type
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
//end first action
        
//second action
        let isVisitedTitle = self.restaurants[index].isVisited! ? "I wasn't here" : "I was here"
        
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { (action) in
            let cell = tableView.cellForRow(at: indexPath)
            
            //self.restaurants[index] = !self.restaurants[index].isVisited
            cell?.accessoryType = self.restaurants[index].isVisited! ? .checkmark : .none
            
            
        }
        
//third action
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        
        ac.addAction(cancel)
        ac.addAction(call)
        ac.addAction(isVisited)
        present(ac, animated: true, completion: nil)
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        showAlert(indexPath.row, tableView, indexPath)
//    }
    
    

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
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) ->
    [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in
            let defaultText = "I now in" + self.restaurants[indexPath.row].name!

            if let image = self.restaurants[indexPath.row].image{
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
            }

        }

        let delete = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }

        return [share, delete]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let dvc = segue.destination as! EatersDetailViewController
                dvc.restaurant = self.restaurants[indexPath.row]
                
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
//
//        let taken = UIContextualAction(style: .normal, title: "Taken") { (action, view, completion) in
//                    print("Just Swiped Taken", action)
//                    completion(true)
//                }
//                taken.backgroundColor =  UIColor(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//
//                let added = UIContextualAction(style: .normal, title: "Added") { (action, view, completion) in
//                    print("Just Swiped Added", action)
//                    completion(false)
//                }
//
//                added.backgroundColor =  UIColor(red: 0.2436070212, green: 0.5393256153, blue: 0.1766586084, alpha: 1)
//
//                let config = UISwipeActionsConfiguration(actions: [added])
//                config.performsFirstActionWithFullSwipe = false
//
//                return config
//    }
//
    
}
