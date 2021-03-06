//
//  ZergTableViewController.swift
//  KompisKlanen
//
//  Created by Robert Elfström on 2017-02-11.
//  Copyright © 2017 robzkidev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ZergTableViewController: UITableViewController {
    
    
    var builds = [[String : Any]]()
    
    var refreshCtrl : UIRefreshControl!
    let kompisColor = UIColor(hexString: "#FF9900")

    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshCtrl = UIRefreshControl()
        self.refreshCtrl.addTarget(self, action: #selector(ZergTableViewController.refreshTableView), for: .valueChanged)
        self.refreshControl = self.refreshCtrl
        
        self.refreshCtrl.backgroundColor = kompisColor
        self.refreshCtrl.tintColor = UIColor.black
        
        self.tableView.separatorColor = kompisColor
        self.tableView.backgroundColor = UIColor.black
        
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().barTintColor = kompisColor
        
        
        self.tableView.separatorInset.left = 0
        
        
        self.navigationItem.title = "Zerg Builds"
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        refreshTableView()
    }
    
    func refreshTableView(){
        
        URLCache.shared.removeAllCachedResponses()
        
        Alamofire.request("https://robzkidev.se/KompisKlanen/Zerg.json").validate(statusCode: 200..<300).responseJSON { (responseData) -> Void in
            
            switch responseData.result {
                
            case .success:
                print("ny hämtar vi ZergBuilds")
            
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                
                if let resData = swiftyJsonVar["Zerg_builds"].arrayObject {
                    self.builds = resData as! [[String:Any]]
                    print(resData)
                    
                    self.tableView.reloadData()
                    self.refreshCtrl.endRefreshing()
            }
            
            case .failure(let error):
                print(error)
                let alertController = UIAlertController(title: "Ingen data kunde hämtas, Robzki är lat....", message: "", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
                
                self.tableView.reloadData()
                self.refreshCtrl.endRefreshing()

        }
        
    }
        
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "zerg_details" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ZergDetailViewController
                
                let videoString = builds[indexPath.row]
                
                controller.buildURL = videoString["URL"] as! String!
                //print(videoString)
            }
        }
    }

        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return builds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        var dict = builds[indexPath.row]
        cell.textLabel?.text = dict["Title"] as? String
        cell.detailTextLabel?.text = dict["Description"] as? String
        cell.imageView?.image = UIImage(named:"zerg_builds.png")
        
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = kompisColor
        cell.detailTextLabel?.textColor = kompisColor

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
