//
//  AppStore.swift
//  AppstoreReviewApp
//
//  Created by shiga on 16/12/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import Foundation
import StoreKit

extension UserDefaults {
    
    static let appOpenedNo = "app_opened"
    static let reviewRequestNo = "review_requested"
    
}

let defaults = UserDefaults.standard


enum StoreReviewHelper {
    
    //1
     static let minimumReviewWorthyActionCount = 3
    
    static func requestAppStoreReviewApp() {
        
        let defaults = UserDefaults.standard
        let bundle = Bundle.main
        
        
        //2
        var actionCount = defaults.integer(forKey: .reviewWorthyActionCount)
        
        //3
        actionCount += 1
        
        //4
        defaults.set(actionCount, forKey: .reviewWorthyActionCount)
        
        //5
        guard  actionCount >= minimumReviewWorthyActionCount else { return}
        
        //6
        let bundleVersionKey = kCFBundleVersionKey as String
        let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
        let lastVersion = defaults.string(forKey: .lastReviewRequestAppVersion)
        
        //7
        guard lastVersion == nil || lastVersion != currentVersion else {
            return
        }
        
        //8
        SKStoreReviewController.requestReview()
        
        //9
        defaults.set(0, forKey: .reviewWorthyActionCount)
        defaults.set(currentVersion, forKey: .lastReviewRequestAppVersion)
    }
}



extension UserDefaults {
   
    enum Key: String {
        case reviewWorthyActionCount
        case lastReviewRequestAppVersion
    }
    
    func integer(forKey key: Key) -> Int {
        return integer(forKey: key.rawValue)
    }
    
    func string(forKey key: Key) -> String? {
        return string(forKey: key.rawValue)
    }
    
    func set(_ integer: Int, forKey key: Key)  {
        set(integer, forKey: key.rawValue)
    }
    
    func set(_ object: Any?, forKey key: Key) {
        set(object, forKey: key.rawValue)
    }
}
