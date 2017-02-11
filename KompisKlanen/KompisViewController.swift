//
//  KompisViewController.swift
//  KompisKlanen
//
//  Created by Robert Elfstrom on 2017-02-06.
//  Copyright © 2017 robzkidev. All rights reserved.
//

import UIKit

class KompisViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL (string: "http://www.kompisklanen.se")
        let request = NSURLRequest(url: url! as URL)
        webView.loadRequest(request as URLRequest)
        
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doRefresh(_:Any) {
        webView.reload()
    }
    
    @IBAction func goBack(_:Any) {
        webView.goBack()
    }
    
    @IBAction func goForward(_: Any) {
        webView.goForward()
    }
    
    @IBAction func stop(_: Any) {
        webView.stopLoading()
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
