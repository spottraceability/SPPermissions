//
//  SPSpotAnalytics.swift
//  Example iOS
//
//  Created by Chris McGehee on 8/31/20.
//  Copyright © 2020 Ivan Vorobei. All rights reserved.
//

import Foundation

#if os(iOS) && SPPERMISSION_ANALYTICS

import UIKit
import AVFoundation

struct SPSpotAnalyticsPermission: SPPermissionProtocol {
    
    var isDeniedClosure: (()->(Bool))? = nil
    var isAuthorizedClosure: (()->(Bool))? = nil
    var onRequest: (()->())? = nil
    
    var isAuthorized: Bool {
        return self.isAuthorizedClosure?() ?? false
    }
    
    var isDenied: Bool {
        return self.isDeniedClosure?() ?? true
    }
    
    func request(completion: @escaping ()->()?) {
        
        self.onRequest?()
        
        DispatchQueue.main.async {
            completion()
        }

    }
}

#endif
