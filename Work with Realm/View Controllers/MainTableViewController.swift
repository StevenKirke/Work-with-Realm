//
//  MainTableViewController.swift
//  Work with Realm
//
//  Created by Steven Kirke on 22.08.2020.
//  Copyright © 2020 Steven Kirke. All rights reserved.
//


// привязываем данный класс CustomTableViewCell к Cell через настойку ячейки Cell во ViewController

import UIKit

class MainTableViewController: UITableViewController, UITextFieldDelegate {
    
    var cars = Cars.getCars()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addList(_ sender: UIBarButtonItem) {
        addNewCar()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell  // кастим ячейку с новым клвссом MainTableViewController для соедения с новыми элементами ячейки
        
        cell.nameLabel?.text = cars[indexPath.row].nameModel
        cell.descriptionLabel?.text = cars[indexPath.row].descriptionModel
        cell.priceLabel?.text = cars[indexPath.row].priceCar
        
        return cell
    }
    
    func addNewCar() {
        
        let blockSave = UIAlertController(title: "New auto", message: "Add new car", preferredStyle: .alert)
        

        
        blockSave.addTextField { textField in
            textField.placeholder = "Add car"
            //textField.addTarget(self, action: #selector(changeText), for: .editingDidEnd)
        }
        
        blockSave.addTextField { textField in
            textField.placeholder = "Add description"
        }
        
        blockSave.addTextField { textField in
            textField.placeholder = "Add price"
        }
        
        let saveBlock = UIAlertAction(title: "Save", style: .default) { _ in
            if blockSave.textFields?.first?.text != "" {
                self.cars.append(Cars(nameModel: (blockSave.textFields?[0].text)!,
                                      descriptionModel: blockSave.textFields?[1].text,
                                      priceCar: (blockSave.textFields?[2].text)!))
                
                self.tableView.reloadData()
            } else {
                print("Введите название")
                
            }
        }
        
//        @objc func changeText() {
//
//        }

        
        let cancelBlock = UIAlertAction(title: "Cancel", style: .default)
        
        blockSave.addAction(saveBlock)
        blockSave.addAction(cancelBlock)
        
        present(blockSave, animated: true)
        
 
    }

    
}

//extension MainTableViewController {
//    @objc func changeText() {
//
//    }
//}

