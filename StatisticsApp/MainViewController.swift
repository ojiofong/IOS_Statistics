//
//  CustomTableViewController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 2/15/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mTableView: UITableView!
    
    var arrDict : NSMutableArray=[]
    var jsonArray = [];
    var titleToDisplay = "";
    var descriptionToDisplay = "";
    var exampleToDisplay = "";
    
    var popularPlaces = [
        ("Statistics", "aroundalogo.png"),
        ("Mean", "ic_place_car.png"),
        ("Median", "ic_place_church.png"),
        ("Mode", "ic_place_coffee.png"),
        ("Range", "ic_place_car.png"),
        ("Average", "aroundalogo.png")
    ]
    
    override func viewWillAppear(animated: Bool) {
        setViewControllerTitle("Statistics for Jerks")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortTuple()
        jsonParsingFromFile()
        
        // mTableView.estimatedRowHeight = 70.0
        // mTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func sortTuple(){
        let sortedPopularPlace = popularPlaces.sort {$0.0 < $1.0 } // sort by first element in tuple
        popularPlaces = sortedPopularPlace;
    }
    
    // no. of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    // no. of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray.count;
    }
    
    // cell for row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell() // used for cells created dynamically
        
        let cell = tableView.dequeueReusableCellWithIdentifier("iconCell", forIndexPath: indexPath)
        
        // get cast of custom cell
        if let iconCell = cell as? IconTableViewCell{
            
            //    let (placeName, iconName) = popularPlaces[indexPath.row];
            let strTitle : String = arrDict[indexPath.row].valueForKey("TITLE") as! String
            
            iconCell.titleLabel?.text = strTitle
            // iconCell.titleLabel?.text = placeName
            //iconCell.imageView?.image = UIImage(named: iconName)
            // iconCell.iconImageView.image = UIImage(named: iconName)
        }
        
        // used to show the full cell dividers
        //        cell.preservesSuperviewLayoutMargins = false
        //        cell.separatorInset = UIEdgeInsetsZero
        //        cell.layoutMargins = UIEdgeInsetsZero
        
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 70.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // deselect the selection
        //  let cell = tableView.cellForRowAtIndexPath(indexPath) as! IconTableViewCell
        //   let text =  cell.titleLabel?.text
        
        titleToDisplay = arrDict[indexPath.row].valueForKey("TITLE") as! String
        descriptionToDisplay = arrDict[indexPath.row].valueForKey("DETAILS") as! String
        exampleToDisplay = arrDict[indexPath.row].valueForKey("EXAMPLE") as! String
        
        goToDetailScreen(titleToDisplay)
        mTableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "statsDetail"{
            let statsDetailController = segue.destinationViewController as? ThirdViewController
            statsDetailController?.textTitle = titleToDisplay
            statsDetailController?.textDescription = descriptionToDisplay
            statsDetailController?.textExample = exampleToDisplay
        }
    }
    
    func goToDetailScreen(str : String){
        setViewControllerTitle("Back") // Alter the text in the next screen's back button
        
        performSegueWithIdentifier("statsDetail", sender: str)
    }
    
    func setViewControllerTitle( mTitle : String){
        self.title = mTitle
    }
    
    func jsonParsingFromFile(){
        let filePath : String = NSBundle.mainBundle().pathForResource("stats", ofType: "json")!
        let data : NSData = try! NSData(contentsOfFile: filePath as String, options: NSDataReadingOptions.DataReadingMapped)
        getDataContents(data)
        
    }
    
    func getDataContents(mData : NSData){
//        let str = String(data: mData, encoding: NSASCIIStringEncoding)
//        print(str)
        
        // init dictionary
        let dict : NSDictionary! = (try! NSJSONSerialization.JSONObjectWithData(mData, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
        
        jsonArray = dict.valueForKey("ITEMS") as! NSArray
        
        for (var i = 0; i < jsonArray.count; i++) {
            
            arrDict.addObject(jsonArray.objectAtIndex(i))
        }
        
    }
    
    
}
