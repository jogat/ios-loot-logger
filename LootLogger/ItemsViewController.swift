//
//  ItemsViewController.swift
//  LootLogger
//
//  Created by Josue Garza Tapia on 11/4/21.
//

import UIKit


class ItemsViewController: UITableViewController {
    
    var itemsStore: ItemStore!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
        
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        let newItem = itemsStore.createItem()
        
        if let index = itemsStore.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showItem":
            if let row = tableView.indexPathForSelectedRow?.row{
                let item = itemsStore.allItems[row]
                let detailController = segue.destination as! DetailViewController
                detailController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell with default appearance
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        //get a new or recycled cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        // Set the text on the cell with the desctiption of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the table view
        let item = itemsStore.allItems[indexPath.row]
        
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        cell.valueLabel.textColor = UIColor.green
        
        if (item.valueInDollars >= 50) {
            cell.valueLabel.textColor = UIColor.red
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
        
            let item = itemsStore.allItems[indexPath.row]
            
            itemsStore.removeItem(item)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemsStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
}
