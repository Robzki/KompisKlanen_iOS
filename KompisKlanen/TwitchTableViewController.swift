//
//  TwitchTableViewController.swift
//  KompisKlanen
//
//  Created by Robert Elfstrom on 2017-02-06.
//  Copyright © 2017 robzkidev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class TwitchTableViewController: UITableViewController {
    
    var vids = [[String : String]]()
    
    var refreshCtrl : UIRefreshControl!
    
    let kompisColor = UIColor(hexString: "#FF9900")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 300
        
        self.refreshCtrl = UIRefreshControl()
        self.refreshCtrl.addTarget(self, action: #selector(TwitchTableViewController.refreshTableView), for: .valueChanged)
        self.refreshControl = self.refreshCtrl
        
        self.refreshCtrl.backgroundColor = kompisColor
        self.refreshCtrl.tintColor = UIColor.black
        
        

        
        downloadVideos()
    }
    
    func downloadVideos() {
        
        
        let urlString = "https://api.twitch.tv/kraken/channels/KompisKlanen/videos?limit=100&client_id=ojzh3cc1s83vj46jrdgp3hkxj3honeu"
        
        
        
        Alamofire.request(urlString).responseJSON { response in
            
            
            switch response.result {
                
            case .success:
                print("nu hämtar vi kompisfilmer, KAPPA!")
            
            let json = JSON(response.result.value!)
            
            if json["_total"].intValue > 0 {
                
                DispatchQueue.main.async {
                    
                    self.parse(json: json)
                    
                    self.tableView.reloadData()
                
                    }
            
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
    func refreshTableView() {
        
        downloadVideos()
        self.refreshCtrl?.endRefreshing()
        
    }
    
    func parse(json: JSON) {
        
        
        for result in json["videos"].arrayValue {
            let title = result["title"].stringValue
            let created_at = result["created_at"].stringValue
            let url = result["_id"].stringValue
            let videoImage = result["preview"].stringValue
            let game = result["game"].stringValue
            let obj = ["title": title, "created_at": created_at, "_id": url, "preview": videoImage, "game": game]
            
            vids.append(obj)
            // print(petitions)
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
        return vids.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      

        let cell:TwitchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TwitchTableViewCell
        
        let videosData = vids[indexPath.row]
        
        cell.vidTitle.text = videosData["title"]
        
        let url=URL(string:self.vids[indexPath.row]["preview"]!)
        
        cell.videoImg.af_setImage(withURL: url!, placeholderImage: nil, filter: nil, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false, completion: nil)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "twitchVids" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! TwitchDetailViewController
                
                let videoString = vids[indexPath.row]
                
                controller._videoID = videoString["_id"]
                controller._videoTitle = videoString["title"]
                //print(videoString)
            }
        }
    }
    
}
