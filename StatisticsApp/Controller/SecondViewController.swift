//
//  SecondViewController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 2/13/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    
    
    let peopleData = [
        ("Michael", "CopperWire"),
        ("Oji", "TechCrunch"),
        ("Benton", "Youbot"),
        ("Jimmy", "Blogger")
    ]
    
    let foodData = [
        ("Bacon", "Tasty"),
        ("Tuna", "Not bad"),
        ("Egg", "Okay"),
        ("Waffle", "Cool"),
        ("Rice", "Nice")
    ]
    
    // no. of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    // no. of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return peopleData.count;
        }else  {
            return foodData.count;
        }
    }
    
    // row cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        
        if indexPath.section == 0 {
            let (names, sites) = peopleData[indexPath.row];
            cell.textLabel?.text = "\(names)"
            cell.detailTextLabel?.text = "\(sites)"
        }else  {
            let (foodName, foodDesc) = foodData[indexPath.row];
            cell.textLabel?.text = "\(foodName) "
            cell.detailTextLabel?.text = "\(foodDesc)"
        }
        
        return cell;
    }
    
    // section title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "People Data";
        }else  {
            return "Food Data";
        }
    }
    
    
    
    // item click
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 {
            let (names, sites) = peopleData[indexPath.row];
            let data = "\(names) \(sites) \(indexPath.row)";
            print(data)
            goToDetailScreen(data)
            
            
        } else  {
            let (foodName, foodDesc) = foodData[indexPath.row];
            let data = "\(foodName) \(foodDesc) \(indexPath.row)";
            print(data)
            goToDetailScreen(data)
        }

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    
    func goToDetailScreen(str : String){
        performSegueWithIdentifier("screen3Detail", sender: str);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "screen3Detail"{
            let screen3VController = segue.destinationViewController as? StatsDetailController
            screen3VController?.textTitle = sender as! String
            
        }
    }
    
    
    func hideButtonRight(){
//     let buttonRight =
    }
    

    
    
}
