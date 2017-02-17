//
//  ProtossDetailViewController.swift
//  KompisKlanen
//
//  Created by Robert Elfström on 2017-02-17.
//  Copyright © 2017 robzkidev. All rights reserved.
//

import UIKit

class ProtossDetailViewController: UIViewController {

    var buildURL: String!
    @IBOutlet weak var buildWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webUrl = URL(string: (buildURL))!
        let webRequest = URLRequest(url: webUrl)
        buildWebView?.loadRequest(webRequest)
        
        // Do any additional setup after loading the view.
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
