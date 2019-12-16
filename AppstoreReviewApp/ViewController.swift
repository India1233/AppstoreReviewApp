//
//  ViewController.swift
//  AppstoreReviewApp
//
//  Created by shiga on 16/12/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import UIKit

enum Appstore {
    static func productURL() -> URL {
        return URL(string: "https://apps.apple.com/app/id958625272")!
    }
}

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }

    @IBAction func appstoreTouchup(_ sender: Any) {
        StoreReviewHelper.requestAppStoreReviewApp()
    }
    
    @IBAction func reviewButtonTouchup(_ sender: Any) {
       reviewAppstoreApp()
    }
    
    @IBAction func shareButtonTouchup(_ sender: Any) {
        shareAppstoreApp()
    }
    
    
    private func reviewAppstoreApp(){
        //1
               var components = URLComponents(url: Appstore.productURL(), resolvingAgainstBaseURL: false)
               //2
               components?.queryItems = [
               URLQueryItem(name: "action", value: "write-review")]
               
               //3
               guard let writeReviewURL = components?.url  else { return}
               
               //4
               UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
    }
    

    private func shareAppstoreApp(){
        //1
        let activityViewController = UIActivityViewController(activityItems: [Appstore.productURL()], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}



