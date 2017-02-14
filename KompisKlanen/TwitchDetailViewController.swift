//
//  TwitchDetailViewController.swift
//  KompisKlanen
//
//  Created by Robert Elfstrom on 2017-02-06.
//  Copyright © 2017 robzkidev. All rights reserved.
//

import UIKit

class TwitchDetailViewController: UIViewController {
    
    @IBOutlet weak var videoWebView: UIWebView!
    
    var _videoID: String!
    
    var _videoTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = (_videoTitle)
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        
        let webUrl = URL(string: "https://player.twitch.tv/?video=" + _videoID)!
        let webRequest = URLRequest(url: webUrl)
        videoWebView?.loadRequest(webRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
